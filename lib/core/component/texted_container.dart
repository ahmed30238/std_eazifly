import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextedContainer extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double? radius;
  final BoxConstraints? constraints;
  final double? fontSize;
  final double? borderWidth;
  final Color? textColor;
  final Color? borderColor;
  final BorderRadiusGeometry? customBorderRadius;
  final Color? containerColor;
  const TextedContainer({
    super.key,
    this.height,
    required this.text,
    this.borderColor,
    this.customBorderRadius,
    this.borderWidth,
    this.constraints,
    this.width,
    this.fontSize,
    this.textColor,
    this.containerColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      width: width ?? 100.w,
      height: height ?? 34.h,
      decoration: BoxDecoration(
        borderRadius:
            customBorderRadius ?? BorderRadius.circular(radius ?? 8.r),
        color: containerColor ?? MainColors.lightblue,
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 0,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: MainTextStyle.boldTextStyle(
            fontSize: fontSize ?? 14,
            color: textColor ?? MainColors.blueTextColor,
          ),
        ),
      ),
    );
  }
}
