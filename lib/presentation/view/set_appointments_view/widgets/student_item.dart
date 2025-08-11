import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String name;
  final String image;
  final bool isSelected;
  final bool isDoneAdded;

  const StudentItem({
    super.key,
    required this.isSelected,
    required this.name,
    required this.image,
    required this.isDoneAdded,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 79.75.w,
            height: 98.h,
            decoration: BoxDecoration(
              color: isSelected
                  ? MainColors.surface
                  : MainColors.inputFill,
              borderRadius: 8.cr,
              border: Border.all(
                color: isSelected
                    ? MainColors.primary
                    : MainColors.outline,
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AvatarImage(
                  height: 40.h,
                  width: 40.w,
                  imageUrl: image,
                  shape: BoxShape.circle,
                ),
                8.ph,
                Text(
                  name,
                  style: MainTextStyle.boldTextStyle(
                    color: isSelected
                        ? MainColors.primary
                        : MainColors.onPrimary,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          if (!isSelected) ...{
            Container(
              width: 80.w,
              height: 98.h,
              decoration: BoxDecoration(
                color: MainColors.inputFill.withOpacity(.5),
                borderRadius: 8.cr,
                border: Border.all(
                  color: isSelected
                      ? MainColors.primary
                      : MainColors.outline,
                  width: 2.w,
                ),
              ),
            ),
          },
          if (isDoneAdded)
            // علامة الصح في أعلى الشمال
            Positioned(
              top: -2.h,
              left: -2.w,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 2.w,
                  ),
                ),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 12.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
