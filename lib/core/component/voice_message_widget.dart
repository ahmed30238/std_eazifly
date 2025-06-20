import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:voice_message_package/voice_message_package.dart';

class VoiceMessageWidget extends StatefulWidget {
  final double? areaWidth;
  final double? width;
  final Color? activeSliderColor;
  final Color? inactiveSliderColor;
  final int? noises;
  final Color? backgroundColor;
  final bool isFile;
  final String audioSource;
  final double duration;
  final VoidCallback? onComplete;
  final VoidCallback? onPause;
  final VoidCallback? onPlaying;
  final Function(String)? onError;
  final bool showPlayButton;
  final bool showCounter;
  final Color? playButtonColor;
  final double? playButtonSize;

  const VoiceMessageWidget({
    super.key,
    this.backgroundColor,
    this.activeSliderColor,
    this.inactiveSliderColor,
    this.noises,
    this.areaWidth,
    this.width,
    required this.audioSource,
    required this.duration,
    required this.isFile,
    this.onComplete,
    this.onPause,
    this.onPlaying,
    this.onError,
    this.showPlayButton = true,
    this.showCounter = true,
    this.playButtonColor,
    this.playButtonSize,
  });

  @override
  State<VoiceMessageWidget> createState() => _VoiceMessageWidgetState();
}

class _VoiceMessageWidgetState extends State<VoiceMessageWidget> {
  late VoiceController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    try {
      _controller = VoiceController(
        noiseCount: widget.noises ?? 45,
        audioSrc: widget.audioSource,
        maxDuration: Duration(seconds: widget.duration.toInt()),
        isFile: widget.isFile,
        onComplete: () {
          widget.onComplete?.call();
        },
        onPause: () {
          widget.onPause?.call();
        },
        onPlaying: () {
          widget.onPlaying?.call();
        },
        onError: (err) {
          widget.onError?.call(err.toString());
        },
      );
      _isInitialized = true;
    } catch (e) {
      debugPrint('Error initializing VoiceController: $e');
      _isInitialized = false;
    }
  }

  @override
  void dispose() {
    if (_isInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized || widget.audioSource.isEmpty) {
      return _buildErrorWidget();
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      width: widget.areaWidth ?? 258.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? MainColors.veryLightGrayFormField,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: VoiceMessageView(
              controller: _controller,
              innerPadding: 0,
              cornerRadius: 0,
              backgroundColor: widget.backgroundColor ?? MainColors.veryLightGrayFormField,
              
              // Wave configuration
              activeSliderColor: widget.activeSliderColor ?? MainColors.blueTextColor,
              notActiveSliderColor: widget.inactiveSliderColor ?? MainColors.checkBoxBorderGray.withOpacity(0.3),
              
              // Play/Pause buttons
              playIcon: widget.showPlayButton 
                ? Icon(
                    Icons.play_arrow,
                    color: widget.playButtonColor ?? MainColors.blueTextColor,
                    size: widget.playButtonSize ?? 20.sp,
                  )
                : const SizedBox.shrink(),
              
              pauseIcon: widget.showPlayButton
                ? Icon(
                    Icons.pause,
                    color: widget.playButtonColor ?? MainColors.blueTextColor,
                    size: widget.playButtonSize ?? 20.sp,
                  )
                : const SizedBox.shrink(),
              
              // Counter text style
              counterTextStyle: widget.showCounter
                ? MainTextStyle.regularTextStyle(
                    fontSize: 10,
                    color: MainColors.blueTextColor,
                  )
                : TextStyle(fontSize: 0.sp, height: 0),
              
              // Hide unnecessary elements
              refreshIcon: const SizedBox.shrink(),
              stopDownloadingIcon: const SizedBox.shrink(),
              
              // Circle configuration (hide circles)
              size: widget.showPlayButton ? 30.sp : 0,
              circlesColor: Colors.transparent,
              circlesTextStyle: TextStyle(fontSize: 0.sp, height: 0),
              circelContainerHeight: 0,
              circelContainerwidth: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      width: widget.areaWidth ?? 258.w,
      height: 44.h,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? MainColors.veryLightGrayFormField,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Icon(
            Icons.error_outline,
            color: MainColors.checkBoxBorderGray,
            size: 16.sp,
          ),
          8.pw,
          Expanded(
            child: Text(
              "غير متاح",
              style: MainTextStyle.regularTextStyle(
                fontSize: 10,
                color: MainColors.checkBoxBorderGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}