import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProgramWithStatsContainer extends StatelessWidget {
  final String image;
  final String likes;
  final String noOfSubscription;
  final String title;
  final String views;
  final VoidCallback onTap;

  const ProgramWithStatsContainer({
    super.key,
    required this.image,
    required this.likes,
    required this.noOfSubscription,
    required this.title,
    required this.views,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            AvatarImage(
              height: 131.h,
              width: 165.w,
              radius: 8.r,
              imageUrl: image,
            ),
            // Container(
            //   clipBehavior: Clip.antiAlias,
            //   height: 131.h,
            //   width: 165.w,
            //   decoration: BoxDecoration(
            //     borderRadius: 8.cr,
            //     image: const DecorationImage(
            //       fit: BoxFit.cover,
            //       image: AssetImage(
            //         Assets.imagesPersona,
            //       ),
            //     ),
            //   ),
            // ),
            8.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
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
                              Assets.iconsPlay,
                            ),
                            4.pw,
                            Text(
                              views,
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
                              Assets.iconsHeart,
                            ),
                            4.pw,
                            Text(
                              likes,
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
                              Assets.iconsPeople,
                            ),
                            4.pw,
                            Text(
                              noOfSubscription,
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
      ),
    );
  }
}
