import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/goals_view/goals_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GoalsItem extends StatelessWidget {
  final String title;
  final String points;
  final String description1;
  final String description2;
  final VoidCallback onTap;

  const GoalsItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.points,
    required this.description1,
    required this.description2,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 16.w,bottom: 16.h), // Adjusted margin
        height: 96.h,
        width: 319.w,
        decoration: BoxDecoration(
          color: MainColors.veryLightGrayFormField,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: MainColors.grayBorderColor, width: 2.w),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           CustomBadge(),
            12.pw,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 21.h,
                  width: 211.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: MainTextStyle.boldTextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      SvgPicture.asset(Assets.iconsCoin),
                      Text(
                        points,
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 11,
                          color: MainColors.grayTextColors,
                        ),
                      ),
                    ],
                  ),
                ),
                8.ph,
                Text(
                  description1,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
                4.ph,
                Text(
                  description2,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
