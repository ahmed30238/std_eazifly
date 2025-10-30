import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureData extends StatelessWidget {
  final String host;
  const LectureData({super.key, required this.host});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: 109.w,
      height: 80.h,
      decoration: BoxDecoration(
        color: MainColors.inputFill,
        borderRadius: 12.cr,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 12.ph,
          Text(
            "بيانات المحاضرة",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.onSurfaceSecondary,
            ),
          ),
          8.ph,
          Text(host, style: MainTextStyle.boldTextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
