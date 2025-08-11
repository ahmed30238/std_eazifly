import 'dart:math';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

class VoiceMessageWidget extends StatefulWidget {
  final double? areaWidth;
  final double? width;
  final Color? activeSliderColor;
  final int? noises;
  final Color? backgroundColor;
  final bool? justWave;
  final String audioUrl;
  final VoidCallback? onComplete;
  final VoidCallback? onPause;
  final VoidCallback? onPlaying;
  final Function(String)? onError;

  const VoiceMessageWidget({
    super.key,
    required this.audioUrl,
    this.backgroundColor,
    this.activeSliderColor,
    this.noises,
    this.areaWidth,
    this.justWave = false,
    this.width,
    this.onComplete,
    this.onPause,
    this.onPlaying,
    this.onError,
  });

  @override
  State<VoiceMessageWidget> createState() => _VoiceMessageWidgetState();
}

class _VoiceMessageWidgetState extends State<VoiceMessageWidget>
    with TickerProviderStateMixin {
  late AudioPlayer audioPlayer;
  late AnimationController animationController;
  bool isLoading = true;
  String? errorMessage;
  bool isPlaying = false;
  Duration currentDuration = Duration.zero;
  Duration totalDuration = Duration.zero;
  double currentPosition = 0.0;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _initializeAudioPlayer();
  }

  void _initializeAudioPlayer() async {
    try {
      await audioPlayer.setUrl(widget.audioUrl);
      
      // Listen to player state changes
      audioPlayer.playerStateStream.listen((state) {
        if (mounted) {
          setState(() {
            isPlaying = state.playing;
          });
          
          if (state.playing) {
            animationController.repeat();
            widget.onPlaying?.call();
          } else {
            animationController.stop();
            widget.onPause?.call();
          }
          
          if (state.processingState == ProcessingState.completed) {
            widget.onComplete?.call();
          }
        }
      });

      // Listen to duration changes
      audioPlayer.durationStream.listen((duration) {
        if (mounted && duration != null) {
          setState(() {
            totalDuration = duration;
            isLoading = false;
          });
        }
      });

      // Listen to position changes
      audioPlayer.positionStream.listen((position) {
        if (mounted && totalDuration.inMilliseconds > 0) {
          setState(() {
            currentDuration = position;
            currentPosition = position.inMilliseconds / totalDuration.inMilliseconds;
          });
        }
      });

      _validateAudioFile();
    } catch (e) {
      setState(() {
        errorMessage = 'خطأ في تحميل الملف الصوتي';
        isLoading = false;
      });
      widget.onError?.call(e.toString());
    }
  }

  void _validateAudioFile() {
    if (widget.audioUrl.isNotEmpty) {
      final supportedFormats = ['m4a', 'mp3', 'wav', 'aac'];
      final fileExtension = widget.audioUrl.split('.').last.toLowerCase();

      if (supportedFormats.contains(fileExtension)) {
        setState(() {
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'تنسيق الملف الصوتي غير مدعوم';
          isLoading = false;
        });
      }
    } else {
      setState(() {
        errorMessage = 'رابط الملف الصوتي فارغ';
        isLoading = false;
      });
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    animationController.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    try {
      if (isPlaying) {
        await audioPlayer.pause();
      } else {
        await audioPlayer.play();
      }
    } catch (e) {
      widget.onError?.call(e.toString());
    }
  }

  void _seekToPosition(double position) async {
    if (totalDuration.inMilliseconds > 0) {
      final seekPosition = Duration(
        milliseconds: (position * totalDuration.inMilliseconds).round(),
      );
      await audioPlayer.seek(seekPosition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: widget.areaWidth ?? 258.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? MainColors.inputFill,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: isLoading
          ? _buildLoadingWidget()
          : errorMessage != null
              ? _buildErrorWidget()
              : _buildVoiceWidget(),
    );
  }

  Widget _buildLoadingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16.w,
          height: 16.h,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.activeSliderColor ?? MainColors.primary,
            ),
          ),
        ),
        8.pw,
        Text(
          "جاري التحميل...",
          style: MainTextStyle.regularTextStyle(
            fontSize: 11,
            color: MainColors.onSurfaceSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 16.sp,
          color: Colors.red,
        ),
        8.pw,
        Expanded(
          child: Text(
            errorMessage ?? 'خطأ في تحميل الملف',
            style: MainTextStyle.regularTextStyle(
              fontSize: 11,
              color: Colors.red,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildVoiceWidget() {
    return Row(
      children: [
        if (widget.justWave == false) ...[
          Text(
            totalDuration == Duration.zero
                ? "--:--"
                : _formatDuration(currentDuration),
            style: MainTextStyle.boldTextStyle(
              fontSize: 11,
              color: MainColors.onSurfaceSecondary,
            ),
          ),
          4.pw,
          GestureDetector(
            onTap: _togglePlayPause,
            child: isPlaying
                ? Icon(Icons.pause, size: 20.w, color: MainColors.primary)
                : SvgPicture.asset(
                    Assets.iconsPlay,
                    width: 20.w,
                    height: 20.h,
                  ),
          ),
          10.pw,
        ] else ...[
          0.pw,
        ],
        Expanded(
          child: SizedBox(
            width: widget.width ?? 170.w,
            height: 30.h,
            child: CustomAudioWaveform(
              progress: currentPosition,
              isPlaying: isPlaying,
              onTap: _seekToPosition,
              activeColor: widget.activeSliderColor ?? MainColors.primary,
              inactiveColor: MainColors.onSurfaceSecondary,
              animationController: animationController,
              barsCount: widget.noises ?? 45,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomAudioWaveform extends StatelessWidget {
  final double progress;
  final bool isPlaying;
  final Function(double) onTap;
  final Color activeColor;
  final Color inactiveColor;
  final AnimationController animationController;
  final int barsCount;

  const CustomAudioWaveform({
    super.key,
    required this.progress,
    required this.isPlaying,
    required this.onTap,
    required this.activeColor,
    required this.inactiveColor,
    required this.animationController,
    this.barsCount = 45,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        final RenderBox renderBox = context.findRenderObject() as RenderBox;
        final localPosition = renderBox.globalToLocal(details.globalPosition);
        final progress = localPosition.dx / renderBox.size.width;
        onTap(progress.clamp(0.0, 1.0));
      },
      child: CustomPaint(
        painter: WaveformPainter(
          progress: progress,
          isPlaying: isPlaying,
          activeColor: activeColor,
          inactiveColor: inactiveColor,
          animation: animationController,
          barsCount: barsCount,
        ),
        size: const Size(double.infinity, 30),
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  final double progress;
  final bool isPlaying;
  final Color activeColor;
  final Color inactiveColor;
  final Animation<double> animation;
  final int barsCount;

  WaveformPainter({
    required this.progress,
    required this.isPlaying,
    required this.activeColor,
    required this.inactiveColor,
    required this.animation,
    required this.barsCount,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final barWidth = size.width / barsCount;
    final random = Random(42); // Fixed seed for consistent waveform

    for (int i = 0; i < barsCount; i++) {
      final x = i * barWidth + barWidth / 2;
      
      // Generate consistent random heights for the waveform
      final baseHeight = (random.nextDouble() * 0.7 + 0.3) * size.height;
      
      // Add animation effect when playing
      double height = baseHeight;
      if (isPlaying) {
        final animationOffset = sin((animation.value * 2 * pi) + (i * 0.2)) * 0.2;
        height = baseHeight * (1 + animationOffset);
      }
      
      // Determine color based on progress
      final barProgress = i / barsCount;
      paint.color = barProgress <= progress ? activeColor : inactiveColor;
      
      // Draw the bar
      final startY = (size.height - height) / 2;
      final endY = startY + height;
      
      canvas.drawLine(
        Offset(x, startY),
        Offset(x, endY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}