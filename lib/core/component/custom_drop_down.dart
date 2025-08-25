import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizedDropdownWidget<T> extends StatelessWidget {
  final String hintText;
  final String? Function(T? val)? validator;
  final void Function(T? val)? onChanged;
  final Color? borderColor;
  final T? initialValue;
  final List<DropdownMenuItem<T>>? items;
  final Widget? prefixIconWidget;
  final TextStyle? hintStyle;
  final String? suffixText;
  final String? prefixText;
  final int? maxLines;
  final Widget? suffixIconWidget;
  final Color? filledColor;
  final bool enabled;
  final VoidCallback? onSuffixPressed;
  final bool? filled;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final bool? isSecured;
  final void Function()? onTap;

  const CustomizedDropdownWidget({
    super.key,
    required this.hintText,
    this.validator,
    this.borderColor,
    this.initialValue,
    required this.items,
    required this.onChanged,
    this.prefixIconWidget,
    this.hintStyle,
    this.suffixText,
    this.prefixText,
    this.onSuffixPressed,
    this.suffixIcon,
    this.maxLines,
    this.isSecured,
    this.suffixIconWidget,
    this.enabled = true,
    this.filled,
    this.controller,
    this.filledColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      
      isDense: true,
      // isExpanded: true,
      hint: Align(alignment: Alignment.center, child: Text(hintText)),
      onTap: onTap,
      // onChanged: (_) {},
      // isExpanded: true,
      // isDense: true,
      // isExpanded: false,
      // hint: Text(hintText),
      elevation: 3,
      value: initialValue,
      onChanged: onChanged,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: Colors.grey,
        size: 24.r,
      ),
      items: items,
      validator: validator,
      decoration: InputDecoration(
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
        suffixIconConstraints: BoxConstraints(
          minHeight: 2.h,
          minWidth: 2.w,
        ),
        prefixIconConstraints: BoxConstraints(
          minHeight: 2.h,
          minWidth: 2.w,
        ),
        prefixIcon: prefixIconWidget,
        suffixIcon: suffixIconWidget ??
            (suffixIcon != null
                ? IconButton(
                    icon: Icon(suffixIcon),
                    onPressed: onSuffixPressed,
                  )
                : null),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 9.w),
        // suffix: Icon(Icons.add),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5.w,
            color: MainColors.outline,
          ),
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5.w,
            color: MainColors.outline,
          ),
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),

        enabled: enabled,
        filled: filled ?? true,
        fillColor: filledColor ?? MainColors.inputFill,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5.w,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5.w,
            color: borderColor ?? MainColors.surfaceVariant,
          ),
          borderRadius: BorderRadius.circular(
            12.r,
          ),
        ),
      ),
    );
  }
}
