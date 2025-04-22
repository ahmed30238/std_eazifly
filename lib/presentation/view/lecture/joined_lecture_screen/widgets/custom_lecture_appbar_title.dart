import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLectureAppbarTitle extends StatelessWidget {
  const CustomLectureAppbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          MyImages.iconsRecordOn,
        ),
        4.pw,
        TextedContainer(
          text: "live",
          containerColor: MainColors.red,
          width: 63.w,
          height: 24.h,
          radius: 4.r,
          textColor: MainColors.white,
        ),
        15.pw,
      ],
    );
  }
}