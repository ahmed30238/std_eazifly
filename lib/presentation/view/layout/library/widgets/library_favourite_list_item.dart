import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LibraryFavouriteListItem extends StatelessWidget {
  final int index;
  const LibraryFavouriteListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 16.w,
        left: 16.w,
        top: index == 0 ? 16.h : 0,
        bottom: index == 5 ? 16.h : 0, // todo last item list.length -1
      ),
      padding: EdgeInsets.all(8.r),
      height: 96.h,
      width: 343.w,
      decoration: BoxDecoration(
        borderRadius: 16.cr,
        color: MainColors.veryLightGrayFormField,
      ),
      child: Row(
        children: [
          const ImageContainer(),
          8.pw,
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "إسم القائمة",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            MyImages.play,
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
                      16.pw,
                      Row(
                        children: [
                          SvgPicture.asset(
                            MyImages.heart,
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
                      16.pw,
                      Row(
                        children: [
                          SvgPicture.asset(
                            MyImages.people,
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
          SvgPicture.asset(MyImages.heart), // todo horizontal triple dots
        ],
      ),
    );
  }
}
