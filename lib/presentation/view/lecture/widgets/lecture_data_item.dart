import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LectureData extends StatelessWidget {
  const LectureData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 80.h,
      decoration: BoxDecoration(
          color: MainColors.veryLightGrayFormField,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          12.ph,
          Text(
            "بيانات المحاضرة",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.grayTextColors,
            ),
          ),
          8.ph,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "عبر تطبيق زوم",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                ),
              ),
              TextedContainer(
                text: "بعد 2 دقيقة ",
                containerColor: MainColors.lightYellow,
                textColor: MainColors.yellow,
                radius: 16.r,
              ),
            ],
          ),
        ],
      ),
    );
  }
}