import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitledFormFieldItem extends StatelessWidget {
  final String titleText;
  final int? maxLines;
  final Color? enTextColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool? enabled;
  final Widget? iconWidget;
  final String formfieldHintText;
  final String? formfieldEnText;
  final double? formFieldheight;

  final Widget? suffIcon;
  const TitledFormFieldItem({
    this.controller,
    super.key,
    this.enabled,
    this.validator,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.enTextColor,
    required this.titleText,
    this.suffIcon,
    required this.formfieldHintText,
    this.formfieldEnText,
    this.formFieldheight,
    this.iconWidget,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              titleText,
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
                color: MainColors.blackText,
              ),
            ),
            8.pw,
            iconWidget ??
                Container(
                  height: 26.h,
                  width: 66.w,
                  decoration: BoxDecoration(
                    color: MainColors.lightblue,
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "قيد المراجعة",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 11,
                        color: MainColors.blueTextColor,
                      ),
                    ),
                  ),
                )
          ],
        ),
        8.ph,
        SizedBox(
          // height: formFieldheight ?? 44.h,
          child: CustomTextFormField(
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            border: border,
            enabled: enabled,
            controller: controller,
            validator: validator,
            maxLines: maxLines,
            hintText: formfieldHintText,
            suffixIconWidget: suffIcon ??
                Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    formfieldEnText ?? '',
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: enTextColor ?? MainColors.formFieldgrayTextColor,
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
