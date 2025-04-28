import 'package:eazifly_student/core/component/image_conainer.dart';
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
  const StudentDataItem({
    super.key,
    required this.index,
    this.width,
    this.onTrailingIconTap,
    this.hasTrailingIcon = true,
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
          ImageContainer(
            shape: BoxShape.circle,
            image: MyImages.imagesPersona,
            containerHeight: 45.h,
            containerWidth: 45.w,
          ),
          8.pw,
          //! name and age
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ahmed Salama",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
              8.ph,
              Text(
                "15 عام",
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
                "01030837974",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
            ],
          ),
          if (hasTrailingIcon) const Spacer(),
          if (hasTrailingIcon)
            InkWell(
              onTap: onTrailingIconTap,
              child: SvgPicture.asset(
                MyImages.iconsHorizontalDots,
              ),
            ),
        ],
      ),
    );
  }
}
