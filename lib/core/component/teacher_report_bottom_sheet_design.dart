import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/notifications_view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherReportBottomSheetDesign extends StatelessWidget {
  const TeacherReportBottomSheetDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetDesign(
      radius: 8.r,
      height: 552.h,
      widget: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              children: [
                8.ph,
                SizedBox(
                  height: 45.h,
                  width: 343.w,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "تقرير المعلم عن المحاضرة",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 15,
                        color: MainColors.onSecondary,
                      ),
                    ),
                  ),
                ),
                ...List.generate(
                  3,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 32.h),
                    child: TitledFormFieldItem(
                      titleText: "سؤال1",
                      formfieldHintText: "مثال1",
                      iconWidget: 0.ph,
                      maxLines: index == 2 ? 4 : 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: CustomElevatedButton(
              width: 311.w,
              height: 48.h,
              color: MainColors.primary,
              textSize: 16,
              radius: 16.r,
              text: "إرسال",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
