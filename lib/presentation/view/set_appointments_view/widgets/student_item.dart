import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class StudentItem extends StatelessWidget {
  final bool isSelected;
  const StudentItem({
    super.key,
    required this.isSelected,
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
              ImageContainer(
                containerHeight: 40.h,
                containerWidth: 40.w,
                image: MyImages.imagesPersona,
                shape: BoxShape.circle,
              ),
              8.ph,
              Text(
                "محمد أشرف",
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