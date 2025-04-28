import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureLink extends StatelessWidget {
  final MainAxisAlignment? linkAlignment;
  final double? width;
  final bool? isFinishedLecture;
  const LectureLink({
    super.key,
    this.width,
    this.linkAlignment,
    this.isFinishedLecture = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      width: width ?? 127.w,
      height: 80.h,
      decoration: BoxDecoration(
          color: MainColors.veryLightGrayFormField,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          12.ph,
          Text(
            "الرابط",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.grayTextColors,
            ),
          ),
          8.ph,
          4.pw,
          InkWell(
            onTap: () {},
            child: Text(
              "Zoom Link",
              style: MainTextStyle.mediumTextStyle(
                fontSize: 14,
                color: isFinishedLecture!
                    ? MainColors.grayTextColors
                    : MainColors.blueTextColor,
              ).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: isFinishedLecture!
                    ? MainColors.grayTextColors
                    : MainColors.blueTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
