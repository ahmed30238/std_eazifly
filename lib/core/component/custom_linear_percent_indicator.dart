import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/presentation/controller/language/applanuage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class CustomLinearPercentIndicator extends StatelessWidget {
  final MainAxisAlignment? alignment;
  final double? width;
  final double percent;

  const CustomLinearPercentIndicator({
    super.key,
    required this.percent,
    this.width,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      alignment:alignment?? MainAxisAlignment.end,
      isRTL: ApplanuageCubit.isArabic(context),
      width: width ?? 343.w,
      lineHeight: 8.h,
      barRadius: Radius.circular(12.r),
      percent: percent,
      backgroundColor: MainColors.lightGray,
      progressColor: MainColors.blueTextColor,
    );
  }
}
