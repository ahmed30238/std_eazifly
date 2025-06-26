import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentItem extends StatelessWidget {
  final String name;
  final String image;
  final bool isSelected;
  const StudentItem({
    super.key,
    required this.isSelected,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 79.75.w,
          height: 98.h,
          decoration: BoxDecoration(
            color: isSelected
                ? MainColors.lightblue
                : MainColors.veryLightGrayFormField,
            borderRadius: 8.cr,
            border: Border.all(
              color: isSelected
                  ? MainColors.blueTextColor
                  : MainColors.grayBorderColor,
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
                  color:
                      isSelected ? MainColors.blueTextColor : MainColors.black,
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
              color: MainColors.veryLightGrayFormField.withOpacity(.5),
              borderRadius: 8.cr,
              border: Border.all(
                color: isSelected
                    ? MainColors.blueTextColor
                    : MainColors.grayBorderColor,
                width: 2.w,
              ),
            ),
          ),
        }
      ],
    );
  }
}
