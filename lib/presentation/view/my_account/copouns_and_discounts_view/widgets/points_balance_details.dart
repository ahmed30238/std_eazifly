import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class PointsBalanceDetailsContainer extends StatelessWidget {
  final String points;
  final String date;
  final String pointsDetails;
  final Color pointsTextColor;
  final String icon;
  const PointsBalanceDetailsContainer({
    super.key,
    required this.points,
    required this.icon,
    required this.date,
    required this.pointsDetails,
    required this.pointsTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 81.h,
      width: double.infinity,
      color: MainColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(icon),
              8.pw,
              Text(
                points,
                style: MainTextStyle.mediumTextStyle(
                  fontSize: 15,
                  color: pointsTextColor,
                ),
              ),
              const Spacer(),
              Text(
                date,
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.black,
                ),
              )
            ],
          ),
          8.ph,
          Text(
            pointsDetails,
            style: MainTextStyle.mediumTextStyle(
              fontSize: 14,
              color: MainColors.grayTextColors,
            ),
          ),
        ],
      ),
    );
  }
}