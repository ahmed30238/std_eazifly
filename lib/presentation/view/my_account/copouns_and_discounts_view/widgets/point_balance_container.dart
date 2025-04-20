import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/my_account/copouns_and_discounts_view/widgets/points_balance_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsBalanceContainer extends StatelessWidget {
  const PointsBalanceContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 227.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MainColors.veryLightGrayFormField,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            lang.pointsBalance,
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          8.ph,
          const PointsBalanceDetailsContainer(
            date: "1 ديسمبر 2024",
            points: "+50 نقطة",
            pointsDetails: "تسجيل حساب جديد",
            icon: MyImages.iconsPointsIn,
            pointsTextColor: MainColors.greenTeal,
          ),
          12.ph,
          const PointsBalanceDetailsContainer(
            date: "1 ديسمبر 2024",
            points: "+50 نقطة",
            pointsDetails: "استبدال نقاط",
            icon: MyImages.iconsPointsOut,
            pointsTextColor: MainColors.blueTextColor,
          ),
        ],
      ),
    );
  }
}
