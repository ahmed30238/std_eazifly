import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentsChangeItem extends StatelessWidget {
  final Color? containerColor;

  final double? height;

  const StudentsChangeItem({
    super.key,
    this.containerColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: double.infinity,
        height: height ?? 60.h,
        decoration: BoxDecoration(
          color: containerColor ?? MainColors.veryLightGrayFormField,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(MyImages.iconsProfile),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "أحمد ياسر",
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
                Text(
                  "5/2",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
              ],
            ),
            SvgPicture.asset(MyImages.iconsProfile),
          ],
        ),
      ),
    );
  }
}
