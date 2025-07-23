import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voice_message_package/voice_message_package.dart';
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

class _VoiceMessageWidgetState extends State<VoiceMessageWidget> {
  late VoiceController voiceController;
  bool isLoading = true;
  String? errorMessage;
  bool isPlaying = false;
  Duration currentDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializeVoiceController();
  }

  void _initializeVoiceController() {
    try {
      voiceController = VoiceController(
        noiseCount: widget.noises ?? 45,
        audioSrc: widget.audioUrl,
        maxDuration: const Duration(seconds: 60),
        isFile: widget.audioUrl.startsWith('https') ? false : true,
        onComplete: () {
          setState(() {
            isPlaying = false;
          });
          widget.onComplete?.call();
        },
        onPause: () {
          setState(() {
            isPlaying = false;
          });
          widget.onPause?.call();
        },
        onPlaying: () {
          setState(() {
            isPlaying = true;
          });
          widget.onPlaying?.call();
        },
        onError: (err) {
          setState(() {
            errorMessage = err.toString();
            isLoading = false;
            isPlaying = false;
          });
          widget.onError?.call(err.toString());
        },
      );

      _fetchAudioDuration();
      _validateAudioFile();
    } catch (e) {
      setState(() {
        errorMessage = 'خطأ في تحميل الملف الصوتي';
        isLoading = false;
      });
    }
  }

  Future<void> _fetchAudioDuration() async {
    try {
      final player = AudioPlayer();
      await player.setUrl(widget.audioUrl);
      final duration = player.duration;
      if (duration != null) {
        setState(() {
          currentDuration = duration;
        });
      }
      await player.dispose();
    } catch (e) {
      setState(() {
        errorMessage = 'فشل في تحميل المدة';
      });
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
    voiceController.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (isPlaying) {
      voiceController.pausePlaying();
    } else {
      voiceController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: widget.areaWidth ?? 258.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? MainColors.veryLightGrayFormField,
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
              widget.activeSliderColor ?? MainColors.blueTextColor,
            ),
          ),
        ),
        8.pw,
        Text(
          "جاري التحميل...",
          style: MainTextStyle.regularTextStyle(
            fontSize: 11,
            color: MainColors.grayTextColors,
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
            currentDuration == Duration.zero
                ? "--:--"
                : _formatDuration(currentDuration),
            style: MainTextStyle.boldTextStyle(
              fontSize: 11,
              color: MainColors.grayTextColors,
            ),
          ),
          4.pw,
          GestureDetector(
            onTap: _togglePlayPause,
            child: isPlaying
                ? Icon(Icons.pause, size: 20.w, color: MainColors.blueTextColor)
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
        SizedBox(
          width: widget.width ?? 170.w,
          child: VoiceMessageView(
            circelContainerHeight: 0,
            circelContainerwidth: 0,
            controller: voiceController,
            innerPadding: 0,
            cornerRadius: 0,
            backgroundColor:
                widget.backgroundColor ?? MainColors.veryLightGrayFormField,
            stopDownloadingIcon: const Icon(Icons.add, size: 0),
            activeSliderColor:
                widget.activeSliderColor ?? MainColors.blueTextColor,
            size: 0,
            notActiveSliderColor: MainColors.transparentColor,
            refreshIcon: const Icon(Icons.add, size: 0),
            counterTextStyle: MainTextStyle.regularTextStyle(
              fontSize: 0,
              color: MainColors.blueTextColor,
            ),
            pauseIcon: const Icon(Icons.add, size: 0),
            playIcon: const Icon(Icons.add, size: 0),
          ).center(),
        ),
      ],
    );
  }
}