import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? prefixIconWidget;
  final String hintText;
  final String? suffixText;
  final String? prefixText;
  final int? maxLines;
  final Widget? suffixIconWidget;
  final Color? filledColor;
  final Color? borderColor;
  final bool? enabled;
  final VoidCallback? onSuffixPressed;
  final String? Function(String? val)? validator;
  final bool? filled;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool? isSecured;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextInputType? keyboardType;
  final InputBorder? disabledBorder;

  const CustomTextFormField({
    required this.hintText,
    this.suffixText,
    this.prefixText,
    this.keyboardType,
    this.validator,
    this.onSuffixPressed,
    this.suffixIcon,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.maxLines,
    this.borderColor,
    this.isSecured,
    this.suffixIconWidget,
    this.prefixIconWidget,
    this.enabled,
    this.filled,
    this.controller,
    this.filledColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      obscureText: isSecured ?? false,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: MainTextStyle.boldTextStyle(
          fontSize: 12,
          color: MainColors.formFieldgrayTextColor,
        ),
        suffixText: suffixText ?? "",
        suffixStyle: MainTextStyle.boldTextStyle(
          fontSize: 12,
          color: MainColors.formFieldgrayTextColor,
        ),
        prefixText: prefixText ?? "",
        prefixStyle: MainTextStyle.boldTextStyle(
          fontSize: 12,
          color: MainColors.formFieldgrayTextColor,
        ),
        suffixIconConstraints: BoxConstraints(
          minHeight: 2.h,
          minWidth: 2.w,
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 2.h,
          minWidth: 2.w,
        ),
        disabledBorder: disabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5.w,
                color: MainColors.grayBorderColor,
              ),
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
        prefixIcon: prefixIconWidget,
        suffixIcon: suffixIconWidget ??
            (suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon),
                    onPressed: onSuffixPressed,
                  )
                : null),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 9.w),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5.w,
                color: MainColors.grayBorderColor,
              ),
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
        enabled: enabled ?? true,
        filled: filled ?? true,
        fillColor: filledColor ?? MainColors.veryLightGrayFormField,
        border: border ??
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5.w,
              ),
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5.w,
                color: borderColor ?? MainColors.lightGray,
              ),
              borderRadius: BorderRadius.circular(
                12.r,
              ),
            ),
      ),
    );
  }
}
