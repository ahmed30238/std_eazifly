import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/divider.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/session_dates_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgramItem extends StatelessWidget {
  const ProgramItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: 16.cr,
        color: MainColors.veryLightGrayFormField,
      ),
      constraints: BoxConstraints(
        minHeight: 300.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 343.w,
            height: 163.h,
            decoration: BoxDecoration(
              borderRadius: 16.cr,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  MyImages.imagesPersona,
                ),
              ),
            ),
          ),
          8.ph,
          Text(
            "الرياضيات للصف السادس الإبتدائي",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
              color: MainColors.black,
            ),
          ),
          4.ph,
          Text(
            "إكتشفوا جمال تعلم القرآن من خلال دروسنا المصممة خصيصًا لقادة المستقبل",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.grayTextColors,
            ),
          ),
          4.ph,
          const WavyDivider(),
          4.ph,
          const SessionDatesDetails(),
          8.ph,
        ],
      ),
    );
  }
}
