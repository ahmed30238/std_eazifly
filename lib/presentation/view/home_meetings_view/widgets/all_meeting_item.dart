import 'package:eazifly_student/core/component/horizntal_divider.dart';
import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/language/applanuage_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/session_dates_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllMeetingItem extends StatelessWidget {
  final bool isRecorded;
  final VoidCallback onTap;
  final VoidCallback onItemTap;
  const AllMeetingItem({
    super.key,
    required this.onTap,
    required this.onItemTap,
    required this.isRecorded,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        height: 301.h,
        decoration: BoxDecoration(
          borderRadius: 12.cr,
          color: MainColors.veryLightGrayFormField,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //! image
            ImageContainer(
              radius: 8.r,
              containerHeight: 143.h,
              containerWidth: 327.w,
              image: MyImages.imagesPersona,
            ),
            12.ph,
            SizedBox(
              height: 26.h,
              child: Padding(
                padding: EdgeInsets.only(
                  right: ApplanuageCubit.isArabic(context) ? 16.w : 0.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "العلوم للصف السادس الإبتدائي",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 14,
                      ),
                    ),
                    InkWell(
                      onTap: onTap,
                      child: TextedContainer(
                        height: 26.h,
                        width: 82.w,
                        text: isRecorded ? "مسجلة" : "بعد  2 يوم",
                        fontSize: 12,
                        radius: 32.r,
                        textColor:
                            !isRecorded ? MainColors.red : MainColors.greenTeal,
                        containerColor: !isRecorded
                            ? MainColors.lightRed
                            : MainColors.lightgreenTeal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            4.ph,
            SizedBox(
              height: 18.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "مراجع شاملة لدراسة العلوم للصف السادس الابتدائي",
                    style: MainTextStyle.mediumTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                ),
              ),
            ),
            12.ph,
            const CustomHorizontalDivider(),
            const Spacer(),
            SizedBox(
              child: SessionDatesDetails(
                fixedFontSize: 12,
                fixedSpace: 8.ph,
                firstTitle: "تاريخ اللقاء",
                firstSubTitle: "2025-4-12",
                secondTitle: "موعد اللقاء",
                secondSubTitle: "12:45 PM",
                thirdTitle: "مدة اللقاء",
                thirdSubTitle: "30 دقيقة",
                isBtn: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
