import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final bool? isDmView;

  CustomAppBar(
    this.context, {
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
                          const ImageContainer(
                              // shape: BoxShape.circle,
                              // containerHeight: 28.h,
                              // containerWidth: 28.w,
                              ),
                          8.pw,
                          Text(
                            "ياسر  محمود",
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
