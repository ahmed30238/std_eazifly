import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StudentDataItem extends StatelessWidget {
  final bool hasTrailingIcon;
  final int index;
  final double? width;
  final VoidCallback? onTrailingIconTap;
  final String name;
  final String age;
  final String phoneNumber;
  final String image;
  const StudentDataItem({
    super.key,
    required this.index,
    this.width,
    this.onTrailingIconTap,
    this.hasTrailingIcon = true,
    required this.age,
    required this.name,
    required this.image,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 8.w,
        left: 8.w,
        top: index == 0 ? 12 : 0,
        bottom: index == 12 ? 12 : 0,
      ),
      height: 65.h,
      width: width ?? 343.w,
      decoration: BoxDecoration(
        borderRadius: 12.cr,
        color: MainColors.veryLightGrayFormField,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //! image
          AvatarImage(
            shape: BoxShape.circle,
            imageUrl: image,
            height: 45.h,
            width: 45.w,
          ),
          8.pw,
          //! name and age
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
              8.ph,
              Text(
                "$age عام",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.grayTextColors,
                ),
              ),
            ],
          ),
          if (hasTrailingIcon) ...{
            20.pw,
          } else ...{
            const Spacer(),
          },
          //! phone
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "رقم التواصل",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.grayTextColors,
                ),
              ),
              8.ph,
              Text(
                phoneNumber,
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
            ],
          ),
          if (hasTrailingIcon) const Spacer(),
          if (hasTrailingIcon)
            InkWell(
              onTap: onTrailingIconTap,
              child: SvgPicture.asset(
                Assets.iconsHorizontalDots,
              ),
            ),
        ],
      ),
    );
  }
}
