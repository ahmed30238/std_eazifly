// pubspec.yaml dependencies:
// audio_waveforms: ^1.0.5
// dio: ^5.3.2 (للتحميل من السيرفر)
// path_provider: ^2.1.1 (للمجلدات المؤقتة)

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ModernVoiceMessageWidget extends StatefulWidget {
  final String audioUrl; // تغيير الاسم ليكون واضح أنه URL
  final String? messageId; // لحفظ الملف بـ ID مميز
  final Color? backgroundColor;
  final Color? waveColor;
  final Color? progressColor;
  final double? width;
  final double? height;
  final VoidCallback? onPlayComplete;
  final Function(String)? onError;
  final Function(double)? onDownloadProgress; // لإظهار نسبة التحميل
  final bool showDuration;
  final bool autoStart;
  final Map<String, String>? headers; // لإضافة headers مثل Authorization

  const ModernVoiceMessageWidget({
    super.key,
    required this.audioUrl,
    this.messageId,
    this.backgroundColor,
    this.waveColor,
    this.progressColor,
    this.width,
    this.height,
    this.onPlayComplete,
    this.onError,
    this.onDownloadProgress,
    this.showDuration = true,
    this.autoStart = false,
    this.headers,
  });

  @override
  State<ModernVoiceMessageWidget> createState() => _ModernVoiceMessageWidgetState();
}

class _ModernVoiceMessageWidgetState extends State<ModernVoiceMessageWidget> {
  late PlayerController playerController;
  bool _isInitialized = false;
  bool _isPlaying = false;
  bool _hasError = false;
  bool _isDownloading = false;
  String? _errorMessage;
  String? _localFilePath;
  Duration _currentDuration = Duration.zero;
  Duration _maxDuration = Duration.zero;
  double _downloadProgress = 0.0;
  
  static final Map<String, String> _cachedFiles = {}; // كاش للملفات المحملة

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  Future<void> _initializeController() async {
    try {
      playerController = PlayerController();
      
      // استمع لحالة التشغيل
      playerController.onPlayerStateChanged.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state.isPlaying;
          });
          
          if (state.isStopped && _currentDuration.inSeconds > 0) {
            widget.onPlayComplete?.call();
          }
        }
      });

      // استمع لتغيير الوقت الحالي
      playerController.onCurrentDurationChanged.listen((duration) {
        if (mounted) {
          setState(() {
            _currentDuration = Duration(milliseconds: duration);
          });
        }
      });

      // تحضير الملف الصوتي
      if (widget.audioUrl.isNotEmpty) {
        await _downloadAndPrepareAudio();
        
        if (mounted && _localFilePath != null) {
          setState(() {
            _isInitialized = true;
            _maxDuration = Duration(milliseconds: playerController.maxDuration);
          });
          
          if (widget.autoStart) {
            await _playPause();
          }
        }
      }
    } catch (e) {
      debugPrint('Error initializing audio: $e');
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = e.toString();
        });
        widget.onError?.call(e.toString());
      }
    }
  }

  Future<void> _downloadAndPrepareAudio() async {
    try {
      // تحقق من الكاش أولاً
      final cacheKey = widget.messageId ?? widget.audioUrl;
      if (_cachedFiles.containsKey(cacheKey)) {
        final cachedPath = _cachedFiles[cacheKey]!;
        final file = File(cachedPath);
        if (await file.exists()) {
          _localFilePath = cachedPath;
          await _prepareLocalAudio();
          return;
        } else {
          _cachedFiles.remove(cacheKey);
        }
      }

      setState(() {
        _isDownloading = true;
        _downloadProgress = 0.0;
      });

      // إنشاء مسار للملف المؤقت
      final tempDir = await getTemporaryDirectory();
      final fileName = widget.messageId ?? 
          DateTime.now().millisecondsSinceEpoch.toString();
      final fileExtension = _getFileExtension(widget.audioUrl);
      _localFilePath = path.join(tempDir.path, 'voice_messages', '$fileName$fileExtension');
      
      // إنشاء المجلد إذا لم يكن موجود
      final directory = Directory(path.dirname(_localFilePath!));
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      // تحميل الملف
      final dio = Dio();
      await dio.download(
        widget.audioUrl,
        _localFilePath!,
        options: Options(
          headers: widget.headers,
          receiveTimeout: const Duration(minutes: 2),
          sendTimeout: const Duration(minutes: 2),
        ),
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = received / total;
            setState(() {
              _downloadProgress = progress;
            });
            widget.onDownloadProgress?.call(progress);
          }
        },
      );

      // حفظ في الكاش
      _cachedFiles[cacheKey] = _localFilePath!;
      
      setState(() {
        _isDownloading = false;
      });

      await _prepareLocalAudio();
      
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _hasError = true;
        _errorMessage = 'فشل في تحميل الملف الصوتي: ${e.toString()}';
      });
      rethrow;
    }
  }

  String _getFileExtension(String url) {
    try {
      final uri = Uri.parse(url);
      final pathSegments = uri.pathSegments;
      if (pathSegments.isNotEmpty) {
        final lastSegment = pathSegments.last;
        if (lastSegment.contains('.')) {
          return '.${lastSegment.split('.').last}';
        }
      }
    } catch (e) {
      debugPrint('Error parsing URL: $e');
    }
    return '.mp3'; // default extension
  }

  Future<void> _prepareLocalAudio() async {
    if (_localFilePath == null) return;
    
    final file = File(_localFilePath!);
    if (await file.exists()) {
      await playerController.preparePlayer(
        path: _localFilePath!,
        shouldExtractWaveform: true,
      );
    } else {
      throw Exception('Downloaded audio file not found');
    }
  }

  Future<void> _playPause() async {
    try {
      if (!_isInitialized) return;
      
      if (_isPlaying) {
        await playerController.pausePlayer();
      } else {
        await playerController.startPlayer();
      }
    } catch (e) {
      debugPrint('Error playing/pausing audio: $e');
      widget.onError?.call(e.toString());
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    if (duration.inHours > 0) {
      String hours = twoDigits(duration.inHours);
      String minutes = twoDigits(duration.inMinutes.remainder(60));
      String seconds = twoDigits(duration.inSeconds.remainder(60));
      return "$hours:$minutes:$seconds";
    } else {
      String minutes = twoDigits(duration.inMinutes.remainder(60));
      String seconds = twoDigits(duration.inSeconds.remainder(60));
      return "$minutes:$seconds";
    }
  }

  @override
  void dispose() {
    if (_isInitialized) {
      playerController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return _buildErrorWidget();
    }

    if (_isDownloading) {
      return _buildDownloadingWidget();
    }

    if (!_isInitialized) {
      return _buildLoadingWidget();
    }

    return Container(
      width: widget.width ?? 280.w,
      height: widget.height ?? 60.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Play/Pause Button
          GestureDetector(
            onTap: _playPause,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: widget.progressColor ?? Colors.blue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (widget.progressColor ?? Colors.blue).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
                size: 22.sp,
              ),
            ),
          ),
          
          SizedBox(width: 12.w),
          
          // Waveform
          Expanded(
            flex: 3,
            child: AudioFileWaveforms(
              size: Size(double.infinity, 35.h),
              playerController: playerController,
              waveformType: WaveformType.fitWidth,
              playerWaveStyle: PlayerWaveStyle(
                fixedWaveColor: widget.waveColor ?? Colors.grey.withOpacity(0.3),
                liveWaveColor: widget.progressColor ?? Colors.blue,
                spacing: 6.w,
                showSeekLine: false,
                waveCap: StrokeCap.round,
                waveThickness: 3.w,
              ),
              enableSeekGesture: true,
            ),
          ),
          
          if (widget.showDuration) ...[
            SizedBox(width: 8.w),
            // Duration
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    _formatDuration(_currentDuration),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  if (_maxDuration.inSeconds > 0)
                    Text(
                      _formatDuration(_maxDuration),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey[400],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDownloadingWidget() {
    return Container(
      width: widget.width ?? 280.w,
      height: widget.height ?? 60.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: _downloadProgress > 0 ? _downloadProgress : null,
                  strokeWidth: 3.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.progressColor ?? Colors.blue,
                  ),
                ),
                Icon(
                  Icons.download,
                  color: widget.progressColor ?? Colors.blue,
                  size: 16.sp,
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "جاري التحميل...",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                if (_downloadProgress > 0)
                  Text(
                    "${(_downloadProgress * 100).toInt()}%",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[500],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Container(
      width: widget.width ?? 280.w,
      height: widget.height ?? 60.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2.w,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    widget.progressColor ?? Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              "جاري التحميل...",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      width: widget.width ?? 280.w,
      height: widget.height ?? 60.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey[100],
        borderRadius: BorderRadius.circular(30.r),
        border: Border.all(
          color: Colors.red.withOpacity(0.3),
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 24.sp,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "خطأ في تشغيل الملف الصوتي",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (_errorMessage != null)
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.red.withOpacity(0.7),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget للاستخدام السهل مع الـ Network Audio
class NetworkVoiceMessage extends StatelessWidget {
  final String audioUrl;
  final String? messageId; // مهم للكاش
  final Color? primaryColor;
  final Map<String, String>? headers; // للـ Authorization
  final VoidCallback? onPlayComplete;
  final Function(String)? onError;
  
  const NetworkVoiceMessage({
    super.key,
    required this.audioUrl,
    this.messageId,
    this.primaryColor,
    this.headers,
    this.onPlayComplete,
    this.onError,
  });

  @override
  Widget build(BuildContext context) {
    return ModernVoiceMessageWidget(
      audioUrl: audioUrl,
      messageId: messageId,
      backgroundColor: Colors.grey[50],
      waveColor: Colors.grey.withOpacity(0.4),
      progressColor: primaryColor ?? Colors.blue,
      headers: headers,
      onPlayComplete: onPlayComplete ?? () {
        debugPrint("Audio playback completed");
      },
      onError: onError ?? (error) {
        debugPrint("Audio error: $error");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('خطأ في تشغيل الملف الصوتي'),
            backgroundColor: Colors.red,
          ),
        );
      },
      onDownloadProgress: (progress) {
        debugPrint("Download progress: ${(progress * 100).toInt()}%");
      },
    );
  }
}

// مثال على الاستخدام مع الـ Network Audio:
// class NetworkVoiceMessageExample extends StatelessWidget {
//   const NetworkVoiceMessageExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Network Voice Messages')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // رسالة صوتية من السيرفر بدون headers
//             NetworkVoiceMessage(
//               audioUrl: 'https://your-server.com/api/voice/message1.mp3',
//               messageId: 'msg_123', // مهم للكاش
//               primaryColor: Colors.blue,
//             ),
//             const SizedBox(height: 16),
            
//             // رسالة صوتية من السيرفر مع Authorization
//             NetworkVoiceMessage(
//               audioUrl: 'https://your-server.com/api/voice/message2.wav',
//               messageId: 'msg_456',
//               primaryColor: Colors.green,
//               headers: {
//                 'Authorization': 'Bearer your_token_here',
//                 'Accept': 'audio/*',
//               },
//               onPlayComplete: () {
//                 print('Message played successfully!');
//               },
//               onError: (error) {
//                 print('Error playing message: $error');
//               },
//             ),
//             const SizedBox(height: 16),
            
//             // استخدام متقدم مع callbacks مخصصة
//             ModernVoiceMessageWidget(
//               audioUrl: 'https://your-server.com/api/voice/message3.m4a',
//               messageId: 'msg_789',
//               backgroundColor: Colors.blue[50],
//               waveColor: Colors.blue.withOpacity(0.3),
//               progressColor: Colors.blue,
//               width: 320,
//               height: 70,
//               showDuration: true,
//               headers: {
//                 'Authorization': 'Bearer your_token_here',
//                 'User-Agent': 'YourApp/1.0',
//               },
//               onDownloadProgress: (progress) {
//                 print('Download: ${(progress * 100).toInt()}%');
//               },
//               onPlayComplete: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('تم تشغيل الرسالة الصوتية بنجاح!'),
//                     backgroundColor: Colors.green,
//                   ),
//                 );
//               },
//               onError: (error) {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('خطأ: $error'),
//                     backgroundColor: Colors.red,
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// مثال على Chat Message مع Voice
// class ChatVoiceMessage extends StatelessWidget {
//   final String messageId;
//   final String audioUrl;
//   final String senderName;
//   final DateTime timestamp;
//   final bool isMe;
//   final String? authToken;
  
//   const ChatVoiceMessage({
//     super.key,
//     required this.messageId,
//     required this.audioUrl,
//     required this.senderName,
//     required this.timestamp,
//     required this.isMe,
//     this.authToken,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//       child: Row(
//         mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: [
//           if (!isMe) ...[
//             CircleAvatar(
//               radius: 16,
//               child: Text(senderName[0].toUpperCase()),
//             ),
//             const SizedBox(width: 8),
//           ],
//           Flexible(
//             child: Column(
//               crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//               children: [
//                 if (!isMe)
//                   Text(
//                     senderName,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 const SizedBox(height: 4),
//                 Container(
//                   constraints: const BoxConstraints(maxWidth: 280),
//                   child: NetworkVoiceMessage(
//                     audioUrl: audioUrl,
//                     messageId: messageId,
//                     primaryColor: isMe ? Colors.blue : Colors.grey[600],
//                     headers: authToken != null 
//                         ? {'Authorization': 'Bearer $authToken'}
//                         : null,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   _formatTime(timestamp),
//                   style: TextStyle(
//                     fontSize: 10,
//                     color: Colors.grey[500],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           if (isMe) ...[
//             const SizedBox(width: 8),
//             CircleAvatar(
//               radius: 16,
//               backgroundColor: Colors.blue,
//               child: const Icon(Icons.person, color: Colors.white, size: 20),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
  
//   String _formatTime(DateTime dateTime) {
//     return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
//   }
// }