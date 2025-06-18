import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureLink extends StatelessWidget {
  final MainAxisAlignment? linkAlignment;
  final double? width;
  final LectureStatesEnum? state;
  final VoidCallback onLinkTap;
  const LectureLink({
    super.key,
    this.width,
    this.linkAlignment,
    this.state = LectureStatesEnum.pending,
    required this.onLinkTap,
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
            onTap: onLinkTap,
            child: Text(
              "Zoom Link",
              style: MainTextStyle.mediumTextStyle(
                fontSize: 14,
                color: state == LectureStatesEnum.finished
                    ? MainColors.grayTextColors
                    : MainColors.blueTextColor,
              ).copyWith(
                decoration: TextDecoration.underline,
                decorationColor: state == LectureStatesEnum.finished
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
