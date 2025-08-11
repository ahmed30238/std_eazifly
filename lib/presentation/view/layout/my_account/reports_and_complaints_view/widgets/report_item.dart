import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/reports_and_complaints_view/widgets/image_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ReportsAndComplaintsWidget extends StatelessWidget {
  final String state;
  const ReportsAndComplaintsWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (state == "انتهت") ...{
          Container(
            height: 90.h,
            color: MainColors.surfaceVariant,
          ),
        },
        Container(
          height: 90.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImagePart(
                state: state,
              ),
              12.pw,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 291.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "اسم المشكلة",
                          style: MainTextStyle.boldTextStyle(fontSize: 15),
                        ),
                        Text(
                          "9:00 AM",
                          style: MainTextStyle.mediumTextStyle(
                            fontSize: 12,
                            color: MainColors.onSurfaceSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  4.ph,
                  Text(
                    "تقديم ملاحظات حول التصميم الجديد والتغييرات المطلوبة.",
                    style: MainTextStyle.regularTextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}