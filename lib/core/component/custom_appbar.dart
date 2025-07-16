import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/extensions/widgets_extensions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart';

class CustomAppBar extends AppBar {
  final BuildContext context;
  final String mainTitle;
  final String leadingText;
  final VoidCallback? onLeadinTap;
  final IconData? leadingIcon;
  final double? mainTitleFontSize;
  final double? leadingCustomWidth;
  final Widget? customLeading;
  final List<Widget>? customAction;
  final bool? isCenterTitle;
  final Function()? onTitleTapped;
  final double? customElevation;
  final double? customTitleWidth;
  final String? dmImageUrl;
  final String? dmTitle;
  final bool? isDmView;

  CustomAppBar(
    this.context, {
    this.dmImageUrl,
    this.dmTitle,
    required this.mainTitle,
    required this.leadingText,
    this.onLeadinTap,
    this.leadingCustomWidth,
    this.mainTitleFontSize,
    this.customElevation,
    this.customLeading,
    this.isDmView = false,
    this.onTitleTapped,
    this.customAction,
    this.leadingIcon,
    this.customTitleWidth,
    this.isCenterTitle,
    super.key,
  }) : super(
          elevation: customElevation,
          toolbarHeight: kToolbarHeight,
          leadingWidth: leadingCustomWidth ?? 100.w,
          backgroundColor: MainColors.white,
          centerTitle: isCenterTitle,
          title: onTitleTapped != null
              ? Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: !isDmView!
                      ? [
                          GestureDetector(
                            onTap: onTitleTapped,
                            child: Text(
                              mainTitle,
                              style: MainTextStyle.boldTextStyle(
                                fontSize: mainTitleFontSize ?? 15,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            Assets.iconsProfile,
                            fit: BoxFit.scaleDown,
                          ),
                        ]
                      : [
                          AvatarImage(
                            height: 28.h,
                            width: 28.w,
                            shape: BoxShape.circle,
                            imageUrl: dmImageUrl,
                          ),
                          8.pw,
                          Text(
                            dmTitle ?? "",
                            style: MainTextStyle.boldTextStyle(
                              fontSize: mainTitleFontSize ?? 15,
                            ),
                          ),
                        ],
                )
              : SizedBox(
                  width: customTitleWidth,
                  child: Text(
                    mainTitle,
                    overflow: TextOverflow.ellipsis,
                    style: MainTextStyle.boldTextStyle(
                      fontSize: mainTitleFontSize ?? 15,
                    ),
                  ),
                ),
          actions: customAction,
          leading: InkWell(
            onTap: onLeadinTap ?? () => back(context),
            child: customLeading ??
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        leadingIcon ?? Icons.arrow_back_ios,
                        size: 15.r,
                      ),
                      2.pw,
                      Text(
                        leadingText,
                        style: MainTextStyle.boldTextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
          ),
        );
}

class CustomNotificationIcon extends StatelessWidget {
  // final VoidCallback? onTap;
  final bool showBadge;
  const CustomNotificationIcon({
    super.key,
    required this.showBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        color: MainColors.veryLightGrayFormField,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Badge(
        badgeContent: Container(
          width: 5.w,
          height: 5.h,
          decoration: BoxDecoration(
            color: MainColors.red,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        position: BadgePosition.topStart(
          start: 10.w,
          top: 10.h,
        ),
        onTap: () {},
        showBadge: showBadge,
        badgeStyle:  BadgeStyle(
          padding: EdgeInsets.zero,
          borderSide: BorderSide(
            color: MainColors.transparentColor,
          ),
        ),
        badgeAnimation: const BadgeAnimation.fade(
          curve: Curves.easeOut,
        ),
        child:  Icon(
          Icons.notifications,
          color: MainColors.grayTextColors,
        ).center(),
      ),
    );
  }
}
