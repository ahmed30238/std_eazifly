import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final Widget? prefixIconWidget;
  final String hintText;
  final String? suffixText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatter;
  final String? prefixText;
  final int? maxLines;
  final int? minLines;
  final Widget? suffixIconWidget;
  final Color? filledColor;
  final Color? borderColor;
  final bool? isDense;
  final BorderRadius? borderRadius;
  final double? vPadding;
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
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  const CustomTextFormField({
    required this.hintText,
    this.suffixText,
    this.isDense,
    this.borderRadius,
    this.vPadding,
    this.prefixText,
    this.focusNode,
    this.onFieldSubmitted,
    this.keyboardType,
    this.validator,
    this.onSuffixPressed,
    this.suffixIcon,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.disabledBorder,
    this.maxLines,
    this.minLines,
    this.borderColor,
    this.isSecured,
    this.suffixIconWidget,
    this.prefixIconWidget,
    this.enabled,
    this.filled,
    this.controller,
    this.filledColor,
    super.key,
    this.initialValue,
    this.inputFormatter,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      inputFormatters: inputFormatter,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      obscureText: isSecured ?? false,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: isDense,
        hintText: hintText,
        hintStyle: MainTextStyle.boldTextStyle(
          fontSize: 12,
          color: MainColors.onSurfaceVariant,
        ),
        suffixText: suffixText ?? "",
        suffixStyle: MainTextStyle.boldTextStyle(
          fontSize: 12,
          color: MainColors.onSurfaceVariant,
        ),
        prefixText: prefixText ?? "",
        prefixStyle: MainTextStyle.boldTextStyle(
          fontSize: 12,
          color: MainColors.onSurfaceVariant,
        ),
        suffixIconConstraints: BoxConstraints(minHeight: 2.h, minWidth: 2.w),
        prefixIconConstraints: BoxConstraints(minHeight: 2.h, minWidth: 2.w),
        disabledBorder:
            disabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(width: 1.5.w, color: MainColors.outline),
              borderRadius: 12.cr,
            ),
        prefixIcon: prefixIconWidget,
        suffixIcon:
            suffixIconWidget ??
            (suffixIcon != null
                ? IconButton(icon: Icon(suffixIcon), onPressed: onSuffixPressed)
                : null),
        contentPadding: EdgeInsets.symmetric(
          vertical: vPadding ?? 16.h,
          horizontal: 9.w,
        ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(width: 1.5.w, color: MainColors.outline),
              borderRadius: borderRadius ?? 12.cr,
            ),
        enabled: enabled ?? true,
        filled: filled ?? true,
        fillColor: filledColor ?? MainColors.inputFill,
        border:
            border ??
            OutlineInputBorder(
              borderSide: BorderSide(width: 1.5.w),
              borderRadius: borderRadius ?? 12.cr,
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5.w,
                color: borderColor ?? MainColors.surfaceVariant,
              ),
              borderRadius: borderRadius ?? 12.cr,
            ),
      ),
    );
  }
}
