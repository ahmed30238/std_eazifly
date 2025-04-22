import 'package:eazifly_student/core/component/horizntal_divider.dart';
import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeNotificationItem extends StatelessWidget {
  final VoidCallback onTap;
  const HomeNotificationItem({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 84.h,
            child: SizedBox(
              height: 60.h,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconsContainer(
                    width: 40.w,
                    height: 40.h,
                    iconWidget: SvgPicture.asset(
                      MyImages.iconsLiveBroadcasting,
                    ),
                  ),
                  8.pw,
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 295.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "محاضرة ",
                                style: MainTextStyle.boldTextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "12ق",
                                style: MainTextStyle.mediumTextStyle(
                                  fontSize: 12,
                                  color: MainColors.blueTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        4.ph,
                        Text(
                          // overflow: TextOverflow.ellipsis,
                          "مثال :هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص.",
                          style: MainTextStyle.mediumTextStyle(
                            fontSize: 12,
                            color: MainColors.grayTextColors,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const CustomHorizontalDivider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
