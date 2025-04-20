import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonaListTile extends StatelessWidget {
  // final dynamic model;
  final TextStyle? subTitleTextStyle;
  final double? subTitleFontSize;
  final double? titleFontSize;
  final String title;
  final String? image;
  final String? subTitleText;
  final Widget? trailingWidget;
  final Widget? subTitle;
  final double? radius;
  final double? verticalPadding;
  final double? trailingIconSize;
  final double? imageContainerHeight;
  final double? imageContainerWidth;
  final IconData? trailingIcon;
  const PersonaListTile({
    super.key,
    required this.title,
    this.image,
    this.subTitleText,
    // required this.model,
    this.imageContainerHeight,
    this.trailingWidget,
    this.imageContainerWidth,
    this.verticalPadding,
    this.trailingIcon,
    this.trailingIconSize,
    this.radius,
    this.subTitleFontSize,
    this.subTitle,
    this.subTitleTextStyle,
    this.titleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: trailingWidget ??
          Icon(
            trailingIcon,
            size: trailingIconSize,
          ),
      leading: Container(
        width: imageContainerWidth ?? 40.w,
        height: imageContainerHeight ?? 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 15.r),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image == null
                ? const AssetImage(
                    MyImages.iconsSearchNormal,
                  )
                : NetworkImage(image ?? ""),
          ),
        ),
      ),
      title: Padding(
        padding: EdgeInsets.only(bottom: 4.h),
        child: Text(
          title,
          style: MainTextStyle.boldTextStyle(
            fontSize: titleFontSize ?? 12,
            color: MainColors.blackText,
          ),
        ),
      ),
      horizontalTitleGap: 8.w,
      contentPadding: EdgeInsets.symmetric(vertical: verticalPadding ?? 12.h),
      subtitle: subTitle ??
          Text(
            subTitleText ?? "",
            style: subTitleTextStyle ??
                MainTextStyle.boldTextStyle(
                  fontSize: subTitleFontSize ?? 14,
                  color: MainColors.grayTextColors,
                ),
          ),
      minTileHeight: 0.h,
      minVerticalPadding: 0.h,
    );
  }
}
