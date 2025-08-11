import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfDaysToChooseFromItem extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String day;
  const ListOfDaysToChooseFromItem({
    super.key,
    required this.onChanged,
    required this.value,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox.adaptive(
            value: value,
            activeColor: MainColors.primary,
            onChanged: onChanged,
            visualDensity: const VisualDensity(
              horizontal: -4,
              vertical: -4,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: 5.cr,
              side: BorderSide(
                color: MainColors.outline,
                style: BorderStyle.solid,
                strokeAlign: 1,
                width: 1.w,
              ),
            ),
          ),
          Text(
            day,
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
