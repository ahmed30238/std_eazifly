import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LecturerItem extends StatelessWidget {
  final bool isSelected;
  const LecturerItem({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5.w,
          color: isSelected
              ? MainColors.blueTextColor
              : MainColors.formFieldgrayfillColor,
        ),
        color: isSelected
            ? MainColors.lightblue
            : MainColors.veryLightGrayFormField,
        borderRadius: 12.cr,
      ),
      height: 48.h,
      width: 150.w,
      child: Row(
        children: [
          const ImageContainer(
            shape: BoxShape.circle,
            image: MyImages.imagesEditedPersona,
          ),
          Text(
            "احمد سلامة",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}