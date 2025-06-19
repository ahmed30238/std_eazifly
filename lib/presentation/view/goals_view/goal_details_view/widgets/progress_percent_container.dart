import 'package:eazifly_student/core/component/custom_linear_percent_indicator.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressPercentContainer extends StatelessWidget {
  final String percent;
  const ProgressPercentContainer({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      width: double.infinity,
      height: 66.h,
      decoration: BoxDecoration(
        borderRadius: 12.cr,
        color: MainColors.lightblue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.ph,
          SizedBox(
            height: 20.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "نسبة التقدم",
                  style: MainTextStyle.boldTextStyle(fontSize: 11),
                ),
                Text(
                  "$percent %",
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          4.ph,
          CustomLinearPercentIndicator(
            lineHeight: 6.h,
            alignment: MainAxisAlignment.start,
            percent: (double.tryParse(percent) != null ? double.tryParse(percent)! / 100 : 0.0),
            width: 303.w,
          ),
        ],
      ),
    );
  }
}
