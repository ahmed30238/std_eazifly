import 'package:eazifly_student/core/component/custom_rich_text.dart';
import 'package:eazifly_student/core/component/horizntal_divider.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeparatedWidget extends StatelessWidget {
  final bool isThereNotes;
  final Color? dividerColor;
  final double? verticalPadding;
  const SeparatedWidget({
    super.key,
    this.isThereNotes = false,
    this.dividerColor,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: verticalPadding ?? 10.h),
        if (isThereNotes) ...{
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: const CustomRichText(),
          ),
        },
        CustomHorizontalDivider(
          color: dividerColor ?? MainColors.inputFill,
        ),
      ],
    );
  }
}
