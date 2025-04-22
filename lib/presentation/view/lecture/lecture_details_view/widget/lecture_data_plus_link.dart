import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_link_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LectureDataPlusLinkRow extends StatelessWidget {
  const LectureDataPlusLinkRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100.w,
          height: 72.h,
          decoration: BoxDecoration(
              color: MainColors.veryLightGrayFormField,
              borderRadius: BorderRadius.circular(12.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              12.ph,
              Text(
                "بيانات المحاضرة",
                style: MainTextStyle.mediumTextStyle(
                  fontSize: 12,
                  color: MainColors.grayTextColors,
                ),
              ),
              8.ph,
              InkWell(
                onTap: () {},
                child: Text(
                  "عبر تطبيق زوم",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                    color: MainColors.blackText,
                  ),
                ),
              ),
            ],
          ),
        ),
        16.pw,
        LectureLink(
          linkAlignment: MainAxisAlignment.start,
          width: 227.w,
    
        ),
      ],
    );
  }
}