import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SessionCollectionItem extends StatelessWidget {
  const SessionCollectionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      height: 56.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 39.h,
            width: 56.w,
            decoration: BoxDecoration(
              borderRadius: 16.cr,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.imagesPersona,
                ),
              ),
            ),
          ),
          4.pw,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "مجموعة مختارة من الدورات التعليمية",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.black,
                  ),
                ),
                4.ph,
                Text(
                  "إكتشفوا جمال تعلم القرآن من خلال دروسنا المصممة خصيصًا",
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}