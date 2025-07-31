// // pubspec.yaml dependencies:
// // audio_waveforms: ^1.0.5
// // dio: ^5.3.2
// // path_provider: ^2.1.1

// import 'dart:io';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:audio_waveforms/audio_waveforms.dart';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as path;

// class ImprovedVoiceMessageWidget extends StatefulWidget {
//   final String audioUrl;
//   final String? messageId;
//   final Color? backgroundColor;
//   final Color? waveColor;
//   final Color? progressColor;
//   final double? width;
//   final double? height;
//   final VoidCallback? onPlayComplete;
//   final Function(String)? onError;
//   final Function(double)? onDownloadProgress;
//   final bool showDuration;
//   final bool autoStart;
//   final Map<String, String>? headers;
//   final Duration timeoutDuration;
//   final int maxRetryAttempts;

//   const ImprovedVoiceMessageWidget({
//     super.key,
//     required this.audioUrl,
//     this.messageId,
//     this.backgroundColor,
//     this.waveColor,
//     this.progressColor,
//     this.width,
//     this.height,
//     this.onPlayComplete,
//     this.onError,
//     this.onDownloadProgress,
//     this.showDuration = true,
//     this.autoStart = false,
//     this.headers,
//     this.timeoutDuration = const Duration(minutes: 2),
//     this.maxRetryAttempts = 3,
//   });

//   @override
//   State<ImprovedVoiceMessageWidget> createState() => _ImprovedVoiceMessageWidgetState();
// }

// class _ImprovedVoiceMessageWidgetState extends State<ImprovedVoiceMessageWidget> 
//     with WidgetsBindingObserver {
//   PlayerController? playerController;
//   bool _isInitialized = false;
//   bool _isPlaying = false;
//   bool _hasError = false;
//   bool _isDownloading = false;
//   bool _isDisposed = false;
//   String? _errorMessage;
//   String? _localFilePath;
//   Duration _currentDuration = Duration.zero;
//   Duration _maxDuration = Duration.zero;
//   double _downloadProgress = 0.0;
//   int _retryAttempts = 0;
//   Timer? _durationTimer;
  
//   // Static cache for downloaded files
//   static final Map<String, String> _cachedFiles = {};
  
//   // Cancellation token for downloads
//   CancelToken? _cancelToken;
  
//   // Stream subscriptions
//   StreamSubscription? _playerStateSubscription;
//   StreamSubscription? _durationSubscription;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addObserver(this);
//     _initializeController();
//   }

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     if (state == AppLifecycleState.paused && _isPlaying) {
//       _pausePlayer();
//     }
//   }

//   Future<void> _initializeController() async {
//     if (_isDisposed) return;
    
//     try {
//       await _cleanupController();
      
//       playerController = PlayerController();
      
//       // Setup listeners with null checks
//       _playerStateSubscription = playerController!.onPlayerStateChanged.listen((state) {
//         if (!mounted || _isDisposed) return;
        
//         setState(() {
//           _isPlaying = state.isPlaying;
//         });
        
//         if (state.isStopped && _currentDuration.inSeconds > 0) {
//           widget.onPlayComplete?.call();
//         }
//       });

//       _durationSubscription = playerController!.onCurrentDurationChanged.listen((duration) {
//         if (!mounted || _isDisposed) return;
        
//         setState(() {
//           _currentDuration = Duration(milliseconds: duration);
//         });
//       });

//       if (widget.audioUrl.isNotEmpty) {
//         await _downloadAndPrepareAudio();
        
//         if (mounted && !_isDisposed && _localFilePath != null) {
//           setState(() {
//             _isInitialized = true;
//           });
          
//           // Get max duration with retry logic
//           await _getMaxDuration();
          
//           if (widget.autoStart && mounted && !_isDisposed) {
//             await _playPause();
//           }
//         }
//       }
//     } catch (e) {
//       debugPrint('Error initializing audio controller: $e');
//       if (mounted && !_isDisposed) {
//         setState(() {
//           _hasError = true;
//           _errorMessage = 'خطأ في تهيئة مشغل الصوت: ${e.toString()}';
//         });
//         widget.onError?.call(e.toString());
//       }
//     }
//   }

//   Future<void> _getMaxDuration() async {
//     if (_isDisposed || playerController == null) return;
    
//     try {
//       // Wait for the player to be ready
//       await Future.delayed(const Duration(milliseconds: 500));
      
//       if (!_isDisposed && playerController != null) {
//         final maxDuration = playerController!.maxDuration;
//         if (maxDuration > 0) {
//           setState(() {
//             _maxDuration = Duration(milliseconds: maxDuration);
//           });
//         } else {
//           // Retry getting duration
//           _startDurationTimer();
//         }
//       }
//     } catch (e) {
//       debugPrint('Error getting max duration: $e');
//       _startDurationTimer();
//     }
//   }

//   void _startDurationTimer() {
//     _durationTimer?.cancel();
//     _durationTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_isDisposed || playerController == null) {
//         timer.cancel();
//         return;
//       }
      
//       final maxDuration = playerController!.maxDuration;
//       if (maxDuration > 0) {
//         setState(() {
//           _maxDuration = Duration(milliseconds: maxDuration);
//         });
//         timer.cancel();
//       } else if (timer.tick > 10) {
//         // Stop trying after 10 seconds
//         timer.cancel();
//       }
//     });
//   }

//   Future<void> _downloadAndPrepareAudio() async {
//     if (_isDisposed) return;
    
//     try {
//       // Check cache first
//       final cacheKey = widget.messageId ?? widget.audioUrl;
//       if (_cachedFiles.containsKey(cacheKey)) {
//         final cachedPath = _cachedFiles[cacheKey]!;
//         final file = File(cachedPath);
//         if (await file.exists()) {
//           _localFilePath = cachedPath;
//           await _prepareLocalAudio();
//           return;
//         } else {
//           _cachedFiles.remove(cacheKey);
//         }
//       }

//       setState(() {
//         _isDownloading = true;
//         _downloadProgress = 0.0;
//       });

//       // Create temp file path
//       final tempDir = await getTemporaryDirectory();
//       final fileName = widget.messageId ?? 
//           DateTime.now().millisecondsSinceEpoch.toString();
//       final fileExtension = _getFileExtension(widget.audioUrl);
//       _localFilePath = path.join(tempDir.path, 'voice_messages', '$fileName$fileExtension');
      
//       // Create directory if it doesn't exist
//       final directory = Directory(path.dirname(_localFilePath!));
//       if (!await directory.exists()) {
//         await directory.create(recursive: true);
//       }

//       // Download with retry logic
//       await _downloadWithRetry();

//       // Cache the file
//       _cachedFiles[cacheKey] = _localFilePath!;
      
//       if (mounted && !_isDisposed) {
//         setState(() {
//           _isDownloading = false;
//         });
//       }

//       await _prepareLocalAudio();
      
//     } catch (e) {
//       if (mounted && !_isDisposed) {
//         setState(() {
//           _isDownloading = false;
//           _hasError = true;
//           _errorMessage = 'فشل في تحميل الملف الصوتي: ${e.toString()}';
//         });
//       }
//       rethrow;
//     }
//   }

//   Future<void> _downloadWithRetry() async {
//     for (int attempt = 0; attempt <= widget.maxRetryAttempts; attempt++) {
//       if (_isDisposed) throw Exception('Widget disposed');
      
//       try {
//         _cancelToken = CancelToken();
        
//         final dio = Dio();
//         await dio.download(
//           widget.audioUrl,
//           _localFilePath!,
//           cancelToken: _cancelToken,
//           options: Options(
//             headers: widget.headers,
//             receiveTimeout: widget.timeoutDuration,
//             sendTimeout: widget.timeoutDuration,
//           ),
//           onReceiveProgress: (received, total) {
//             if (_isDisposed) return;
            
//             if (total != -1) {
//               final progress = received / total;
//               if (mounted) {
//                 setState(() {
//                   _downloadProgress = progress;
//                 });
//               }
//               widget.onDownloadProgress?.call(progress);
//             }
//           },
//         );
        
//         // Download successful
//         break;
        
//       } catch (e) {
//         _retryAttempts = attempt + 1;
        
//         if (e is DioException && e.type == DioExceptionType.cancel) {
//           throw Exception('Download cancelled');
//         }
        
//         if (attempt == widget.maxRetryAttempts) {
//           throw Exception('Download failed after ${widget.maxRetryAttempts + 1} attempts: $e');
//         }
        
//         // Wait before retry
//         await Future.delayed(Duration(seconds: (attempt + 1) * 2));
//       }
//     }
//   }

//   String _getFileExtension(String url) {
//     try {
//       final uri = Uri.parse(url);
//       final pathSegments = uri.pathSegments;
//       if (pathSegments.isNotEmpty) {
//         final lastSegment = pathSegments.last;
//         if (lastSegment.contains('.')) {
//           final extension = '.${lastSegment.split('.').last}';
//           // Validate audio extension
//           final audioExtensions = ['.mp3', '.wav', '.m4a', '.aac', '.ogg', '.mp4'];
//           if (audioExtensions.contains(extension.toLowerCase())) {
//             return extension;
//           }
//         }
//       }
//     } catch (e) {
//       debugPrint('Error parsing URL: $e');
//     }
//     return '.mp3'; // default extension
//   }

//   Future<void> _prepareLocalAudio() async {
//     if (_isDisposed || _localFilePath == null || playerController == null) return;
    
//     try {
//       final file = File(_localFilePath!);
//       if (await file.exists()) {
//         await playerController!.preparePlayer(
//           path: _localFilePath!,
//           shouldExtractWaveform: true,
//         );
//       } else {
//         throw Exception('Downloaded audio file not found');
//       }
//     } catch (e) {
//       debugPrint('Error preparing local audio: $e');
//       rethrow;
//     }
//   }

//   Future<void> _playPause() async {
//     if (_isDisposed || !_isInitialized || playerController == null) return;
    
//     try {
//       if (_isPlaying) {
//         await _pausePlayer();
//       } else {
//         await playerController!.startPlayer();
//       }
//     } catch (e) {
//       debugPrint('Error playing/pausing audio: $e');
//       widget.onError?.call(e.toString());
//     }
//   }

//   Future<void> _pausePlayer() async {
//     if (_isDisposed || playerController == null) return;
    
//     try {
//       await playerController!.pausePlayer();
//     } catch (e) {
//       debugPrint('Error pausing player: $e');
//     }
//   }

//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     if (duration.inHours > 0) {
//       String hours = twoDigits(duration.inHours);
//       String minutes = twoDigits(duration.inMinutes.remainder(60));
//       String seconds = twoDigits(duration.inSeconds.remainder(60));
//       return "$hours:$minutes:$seconds";
//     } else {
//       String minutes = twoDigits(duration.inMinutes.remainder(60));
//       String seconds = twoDigits(duration.inSeconds.remainder(60));
//       return "$minutes:$seconds";
//     }
//   }

//   Future<void> _cleanupController() async {
//     try {
//       _durationTimer?.cancel();
//       _durationTimer = null;
      
//       _cancelToken?.cancel();
//       _cancelToken = null;
      
//       await _playerStateSubscription?.cancel();
//       _playerStateSubscription = null;
      
//       await _durationSubscription?.cancel();
//       _durationSubscription = null;
      
//       if (playerController != null) {
//         if (_isPlaying) {
//           await playerController!.stopPlayer();
//         }
//         playerController!.dispose();
//         playerController = null;
//       }
//     } catch (e) {
//       debugPrint('Error cleaning up controller: $e');
//     }
//   }

//   @override
//   void dispose() {
//     _isDisposed = true;
//     WidgetsBinding.instance.removeObserver(this);
//     _cleanupController();
//     super.dispose();
//   }

//   // Retry mechanism for failed downloads
//   Future<void> _retryDownload() async {
//     if (_isDisposed) return;
    
//     setState(() {
//       _hasError = false;
//       _errorMessage = null;
//       _retryAttempts = 0;
//     });
    
//     await _downloadAndPrepareAudio();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_hasError) {
//       return _buildErrorWidget();
//     }

//     if (_isDownloading) {
//       return _buildDownloadingWidget();
//     }

//     if (!_isInitialized) {
//       return _buildLoadingWidget();
//     }

//     return Container(
//       width: widget.width ?? 280.w,
//       height: widget.height ?? 60.h,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//       decoration: BoxDecoration(
//         color: widget.backgroundColor ?? Colors.grey[100],
//         borderRadius: BorderRadius.circular(30.r),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // Play/Pause Button
//           GestureDetector(
//             onTap: _playPause,
//             child: Container(
//               width: 40.w,
//               height: 40.h,
//               decoration: BoxDecoration(
//                 color: widget.progressColor ?? Colors.blue,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: (widget.progressColor ?? Colors.blue).withOpacity(0.3),
//                     blurRadius: 8,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 _isPlaying ? Icons.pause : Icons.play_arrow,
//                 color: Colors.white,
//                 size: 22.sp,
//               ),
//             ),
//           ),
          
//           SizedBox(width: 12.w),
          
//           // Waveform
//           Expanded(
//             flex: 3,
//             child: playerController != null 
//                 ? AudioFileWaveforms(
//                     size: Size(double.infinity, 35.h),
//                     playerController: playerController!,
//                     waveformType: WaveformType.fitWidth,
//                     playerWaveStyle: PlayerWaveStyle(
//                       fixedWaveColor: widget.waveColor ?? Colors.grey.withOpacity(0.3),
//                       liveWaveColor: widget.progressColor ?? Colors.blue,
//                       spacing: 6.w,
//                       showSeekLine: false,
//                       waveCap: StrokeCap.round,
//                       waveThickness: 3.w,
//                     ),
//                     enableSeekGesture: true,
//                   )
//                 : Container(
//                     height: 35.h,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(4.r),
//                     ),
//                   ),
//           ),
          
//           if (widget.showDuration) ...[
//             SizedBox(width: 8.w),
//             // Duration
//             Expanded(
//               flex: 1,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     _formatDuration(_currentDuration),
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   if (_maxDuration.inSeconds > 0)
//                     Text(
//                       _formatDuration(_maxDuration),
//                       style: TextStyle(
//                         fontSize: 10.sp,
//                         color: Colors.grey[400],
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildDownloadingWidget() {
//     return Container(
//       width: widget.width ?? 280.w,
//       height: widget.height ?? 60.h,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//       decoration: BoxDecoration(
//         color: widget.backgroundColor ?? Colors.grey[100],
//         borderRadius: BorderRadius.circular(30.r),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40.w,
//             height: 40.h,
//             decoration: BoxDecoration(
//               color: Colors.grey.withOpacity(0.3),
//               shape: BoxShape.circle,
//             ),
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 CircularProgressIndicator(
//                   value: _downloadProgress > 0 ? _downloadProgress : null,
//                   strokeWidth: 3.w,
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                     widget.progressColor ?? Colors.blue,
//                   ),
//                 ),
//                 Icon(
//                   Icons.download,
//                   color: widget.progressColor ?? Colors.blue,
//                   size: 16.sp,
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: 12.w),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "جاري التحميل...",
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 if (_downloadProgress > 0)
//                   Text(
//                     "${(_downloadProgress * 100).toInt()}% ${_retryAttempts > 0 ? '(المحاولة ${_retryAttempts + 1})' : ''}",
//                     style: TextStyle(
//                       fontSize: 12.sp,
//                       color: Colors.grey[500],
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           // Cancel button
//           GestureDetector(
//             onTap: () {
//               _cancelToken?.cancel();
//               setState(() {
//                 _isDownloading = false;
//                 _hasError = true;
//                 _errorMessage = 'تم إلغاء التحميل';
//               });
//             },
//             child: Icon(
//               Icons.close,
//               size: 20.sp,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLoadingWidget() {
//     return Container(
//       width: widget.width ?? 280.w,
//       height: widget.height ?? 60.h,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//       decoration: BoxDecoration(
//         color: widget.backgroundColor ?? Colors.grey[100],
//         borderRadius: BorderRadius.circular(30.r),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40.w,
//             height: 40.h,
//             decoration: BoxDecoration(
//               color: Colors.grey.withOpacity(0.3),
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//               child: SizedBox(
//                 width: 20.w,
//                 height: 20.h,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2.w,
//                   valueColor: AlwaysStoppedAnimation<Color>(
//                     widget.progressColor ?? Colors.blue,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: 12.w),
//           Expanded(
//             child: Text(
//               "جاري التحضير...",
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 color: Colors.grey[600],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildErrorWidget() {
//     return Container(
//       width: widget.width ?? 280.w,
//       height: widget.height ?? 60.h,
//       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//       decoration: BoxDecoration(
//         color: widget.backgroundColor ?? Colors.grey[100],
//         borderRadius: BorderRadius.circular(30.r),
//         border: Border.all(
//           color: Colors.red.withOpacity(0.3),
//           width: 1.w,
//         ),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.error_outline,
//             color: Colors.red,
//             size: 24.sp,
//           ),
//           SizedBox(width: 12.w),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "خطأ في تشغيل الملف الصوتي",
//                   style: TextStyle(
//                     fontSize: 12.sp,
//                     color: Colors.red,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 if (_errorMessage != null)
//                   Text(
//                     _errorMessage!,
//                     style: TextStyle(
//                       fontSize: 10.sp,
//                       color: Colors.red.withOpacity(0.7),
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//               ],
//             ),
//           ),
//           // Retry button
//           GestureDetector(
//             onTap: _retryDownload,
//             child: Container(
//               padding: EdgeInsets.all(8.w),
//               decoration: BoxDecoration(
//                 color: Colors.red.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               child: Icon(
//                 Icons.refresh,
//                 size: 16.sp,
//                 color: Colors.red,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Enhanced wrapper widget
// class NetworkVoiceMessage extends StatelessWidget {
//   final String audioUrl;
//   final String? messageId;
//   final Color? primaryColor;
//   final Map<String, String>? headers;
//   final VoidCallback? onPlayComplete;
//   final Function(String)? onError;
//   final Duration timeoutDuration;
//   final int maxRetryAttempts;
  
//   const NetworkVoiceMessage({
//     super.key,
//     required this.audioUrl,
//     this.messageId,
//     this.primaryColor,
//     this.headers,
//     this.onPlayComplete,
//     this.onError,
//     this.timeoutDuration = const Duration(minutes: 2),
//     this.maxRetryAttempts = 3,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ImprovedVoiceMessageWidget(
//       audioUrl: audioUrl,
//       messageId: messageId,
//       backgroundColor: Colors.grey[50],
//       waveColor: Colors.grey.withOpacity(0.4),
//       progressColor: primaryColor ?? Colors.blue,
//       headers: headers,
//       timeoutDuration: timeoutDuration,
//       maxRetryAttempts: maxRetryAttempts,
//       onPlayComplete: onPlayComplete ?? () {
//         debugPrint("Audio playback completed");
//       },
//       onError: onError ?? (error) {
//         debugPrint("Audio error: $error");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('خطأ في تشغيل الملف الصوتي: $error'),
//             backgroundColor: Colors.red,
//             action: SnackBarAction(
//               label: 'حسناً',
//               textColor: Colors.white,
//               onPressed: () {},
//             ),
//           ),
//         );
//       },
//       onDownloadProgress: (progress) {
//         debugPrint("Download progress: ${(progress * 100).toInt()}%");
//       },
//     );
//   }
// }