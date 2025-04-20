import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voice_message_package/voice_message_package.dart';

class VoiceMessageWidget extends StatelessWidget {
  final double? areaWidth;
  final double? width;
  final Color? activeSliderColor;
  final int? noises;
  final Color? backgroundColor;
  final bool? justWave;
  const VoiceMessageWidget({
    super.key,
    this.backgroundColor,
    this.activeSliderColor,
    this.noises,
    this.areaWidth,
    this.justWave = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: areaWidth ?? 258.w,
      height: 44.h,
      decoration: BoxDecoration(
          color: backgroundColor ?? MainColors.veryLightGrayFormField,
          borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          !justWave!
              ? Text(
                  "12 ث",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                )
              : 0.pw,
          4.pw,
          !justWave!
              ? SvgPicture.asset(
                  MyImages.iconsProfile,
                )
              : 0.pw,
          !justWave! ? 10.pw : 0.pw,
          SizedBox(
            width: width ?? 170.w,
            child: VoiceMessageView(
              circelContainerHeight: 0,
              circelContainerwidth: 0,
              controller: VoiceController(
                noiseCount: noises ?? 45,
                audioSrc: "",
                maxDuration: const Duration(seconds: 10),
                isFile: false,
                onComplete: () {
                  /// do something on complete
                },
                onPause: () {
                  /// do something on pause
                },
                onPlaying: () {
                  /// do something on playing
                },
                onError: (err) {
                  /// do somethin on error
                },
              ),
              innerPadding: 0,
              cornerRadius: 0,
              backgroundColor:
                  backgroundColor ?? MainColors.veryLightGrayFormField,
              stopDownloadingIcon: const Icon(
                Icons.add,
                size: 0,
              ),
              activeSliderColor: activeSliderColor ?? MainColors.blueTextColor,
              size: 0, // play pause
              notActiveSliderColor: MainColors.transparentColor,
              refreshIcon: const Icon(
                Icons.add,
                size: 0,
              ),
              // circlesTextStyle: TextStyle(fontSize: 0.sp,height: 0,color: MainColors.red),
              // circlesColor: MainColors.red,

              counterTextStyle: MainTextStyle.regularTextStyle(
                fontSize: 0,
                color: MainColors.blueTextColor,
              ),
              pauseIcon: const Icon(
                Icons.import_contacts,
                size: 0,
              ),
              playIcon: const Icon(
                Icons.dangerous,
                size: 0,
              ),
            ).center(),
          ),
        ],
      ),
    );
  }
}
