import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLowSizeButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? textColor;
  final Color? btnColor;
  final double? fontSize;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  const CustomLowSizeButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderRadius,
    this.fontSize,
    this.width,
    this.height,
    this.textColor,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? 88.w,
        height: height ?? 26.h,
        decoration: BoxDecoration(
          color: btnColor ?? MainColors.lightblue,
          borderRadius: borderRadius ?? 32.cr,
        ),
        child: Text(
          text,
          style: MainTextStyle.boldTextStyle(
            fontSize: fontSize ?? 14,
            color: textColor ?? MainColors.blueTextColor,
          ),
        ).center(),
      ),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? elevation;

  final VoidCallback onPressed;
  final double? textSize;

  const CustomMaterialButton({
    super.key,
    required this.text,
    this.radius,
    this.borderColor,
    required this.onPressed,
    this.elevation,
    this.textSize,
    this.color,
    this.textColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? 0.w,
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
      height: height ?? 28.h,
      elevation: elevation ?? 0,
      color: color ?? MainColors.lightblue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 32.r),
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: FittedBox(
          // fit: BoxFit.,
          child: Text(
            text,
            style: MainTextStyle.boldTextStyle(
              color: textColor ?? MainColors.blueTextColor,
              fontSize: textSize ?? 14,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double? elevatedButtonWidth;
  final double? elevatedButtonheight;
  final double? borderWidth;
  final double? radius;
  final Widget? child;
  final double? textSize;
  final Function() onPressed;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final TextStyle? textStyle;

  const CustomElevatedButton({
    super.key,
    required this.text,
    this.textColor,
    this.borderWidth,
    this.textStyle,
    this.textSize,
    required this.onPressed,
    this.child,
    this.borderColor,
    this.elevatedButtonWidth,
    this.elevatedButtonheight,
    this.radius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // side: const BorderSide(color: MainColors.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 0.r,
          ),
          side: BorderSide(
              color: borderColor ?? MainColors.transparentColor,
              width: borderWidth ?? 1.w),
        ),
        backgroundColor: color ?? MainColors.veryLightGrayFormField,
        elevation: 0,
        fixedSize: Size(elevatedButtonWidth ?? double.infinity,
            elevatedButtonheight ?? 47.h),
      ),
      child: child ??
          Center(
            child: Text(
              text,
              style: textStyle ??
                  MainTextStyle.boldTextStyle(
                    fontSize: textSize ?? 17,
                    color: textColor ?? Colors.white,
                  ),
            ),
          ),
    );
  }
}
