import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgramWithStatsContainer extends StatelessWidget {
  const ProgramWithStatsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: 197.w,
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: 12.cr,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          16.ph,
          Container(
            clipBehavior: Clip.antiAlias,
            height: 131.h,
            width: 165.w,
            decoration: BoxDecoration(
              borderRadius: 8.cr,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  MyImages.imagesPersona,
                ),
              ),
            ),
          ),
          8.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مجموعة قصص مختارة ",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                    color: MainColors.blackText,
                  ),
                ),
                12.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            MyImages.iconsPlay,
                          ),
                          4.pw,
                          Text(
                            "3566",
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 14,
                              color: MainColors.blackText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            MyImages.iconsHeart,
                          ),
                          4.pw,
                          Text(
                            "153",
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 14,
                              color: MainColors.blackText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            MyImages.iconsPeople,
                          ),
                          4.pw,
                          Text(
                            "344",
                            style: MainTextStyle.boldTextStyle(
                              fontSize: 14,
                              color: MainColors.blackText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
          // 16.ph,
        ],
      ),
    );
  }
}
