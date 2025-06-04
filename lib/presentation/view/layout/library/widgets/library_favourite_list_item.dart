import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LibraryFavouriteListItem extends StatelessWidget {
  final int index;
  final String image;
  final String views;
  final String likes;
  final String title;
  final VoidCallback onTap;
  const LibraryFavouriteListItem(
      {super.key,
      required this.index,
      required this.title,
      required this.views,
      required this.likes,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.r),
        height: 96.h,
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: 16.cr,
          color: MainColors.veryLightGrayFormField,
        ),
        child: Row(
          children: [
            AvatarImage(
              imageUrl: image,
            ),
            8.pw,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: MainTextStyle.boldTextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        Row(
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
                        16.pw,
                        Row(
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
                        16.pw,
                        Row(
                          children: [
                            SvgPicture.asset(
                              Assets.iconsPeople,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            SvgPicture.asset(
              Assets.iconsHorizontalDots,
            ),
          ],
        ),
      ),
    );
  }
}
