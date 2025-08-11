import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconsContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget iconWidget;
  final Color? containerColor;
  const IconsContainer({
    required this.iconWidget,
    this.width,
    this.containerColor,
    this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 40.w,
      height: height ?? 40.h,
      decoration: BoxDecoration(
        color: containerColor ?? MainColors.inputFill,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      child: Center(child: iconWidget),
    );
  }
}