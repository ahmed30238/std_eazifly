import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CustomAppbarLeading extends StatelessWidget {
  const CustomAppbarLeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: MainColors.black, width: 1.w),
          ),
          child: SvgPicture.asset(
            Assets.iconsFlipCamera,
            height: 24.h,
            width: 24.w,
            fit: BoxFit.scaleDown,
          ),
        ),
      ],
    );
  }
}