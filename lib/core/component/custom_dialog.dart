import 'package:eazifly_student/core/component/animated_loader.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? image;
  final bool? loader;
  final double? width;
  final double? height;

  const CustomDialog({
    super.key,
    required this.title,
    required this.subTitle,
    this.width,
    this.height,
    this.image,
    this.loader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        height: height ?? 220.h,
        width: width ?? 298.w,
        decoration: BoxDecoration(
          color: MainColors.background,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title, style: MainTextStyle.boldTextStyle(fontSize: 16)),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: MainTextStyle.mediumTextStyle(
                  fontSize: 12,
                  color: MainColors.onSurfaceSecondary,
                ),
              ),
              loader! ? const AnimatedLoader() : SvgPicture.asset(image ?? ""),
            ],
          ),
        ),
      ),
    );
  }
}
