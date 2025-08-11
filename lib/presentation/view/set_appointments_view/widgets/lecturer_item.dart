import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LecturerItem extends StatelessWidget {
  final String instructorName;
  final String image;
  final bool isSelected;
  const LecturerItem({
    super.key,
    required this.isSelected,
    required this.instructorName,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5.w,
          color: isSelected
              ? MainColors.primary
              : MainColors.surfaceContainerHighest,
        ),
        color: isSelected
            ? MainColors.surface
            : MainColors.inputFill,
        borderRadius: 12.cr,
      ),
      height: 48.h,
      width: 150.w,
      child: Row(
        children: [
          AvatarImage(
            shape: BoxShape.circle,
            imageUrl: image,
          ),
          Text(
            instructorName,
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
