import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/student_change_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter/material.dart';

class LectureReportView extends StatelessWidget {
  const LectureReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تقرير 1",
        leadingText: "بيانات الطالب",
        leadingCustomWidth: 120.w,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Text(
                    "إسم البرنامج",
                    style: MainTextStyle.mediumTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                ),
                14.ph,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    "واجب الرياضيات للصف السادس الإبتدائي",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      // color: MainColors.grayTextColors,
                    ),
                  ),
                ),
                40.ph,
                Container(
                  padding: EdgeInsets.all(16.r),
                  height: 123.h,
                  // constraints: BoxConstraints(
                  //   // minHeight: 123.h,
                  // ),
                  width: double.infinity,
                  color: MainColors.veryLightGrayFormField,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تقرير 1",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 15,
                          color: MainColors.blueTextColor,
                        ),
                      ),
                      8.ph,
                      Expanded(
                        child: Text(
                          "مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص. مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص.",
                          style: MainTextStyle.mediumTextStyle(
                            fontSize: 12,
                            color: MainColors.grayTextColors,
                          ).copyWith(
                            height: 1.5.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const StudentsChangeItem(
            alignment: MainAxisAlignment.spaceEvenly,
          ),
        ],
      ),
    );
  }
}
