import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/goals_view/goals_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GoalsItem extends StatelessWidget {
  final VoidCallback onTap;
  const GoalsItem({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        height: 96.h,
        width: 319.w,
        decoration: BoxDecoration(
          color: MainColors.veryLightGrayFormField,
          borderRadius: 20.cr,
          border: Border.all(color: MainColors.grayBorderColor, width: 2.w),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomBadge(),
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
                        "أصناف الناس في العبادة",
                        style: MainTextStyle.boldTextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        MyImages.iconsCoin,
                      ),
                      Text(
                        "20",
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
                  "تقييم على ماتم حفظه من 1 الى 20",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
                4.ph,
                Text(
                  "إختبار تطبيقي على الغنة والقلقلة",
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
