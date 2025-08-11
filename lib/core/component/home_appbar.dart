import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainAppBar extends AppBar {
  final String? customTitle;
  final String? leadingTitle;
  final Widget? customLeading;
  final bool? isCentered;
  final double? leadingCustomWidth;
  final double? appTitlesize;
  final double? appIconWidth;
  final double? appIconHeight;
  final Widget? titleWidget;
  final Function()? onTap;
  final Function()? onDrawerTap;
  final bool rightNoification;
  final List<Widget>? customactions;
  MainAppBar({
    super.key,
    this.customTitle,
    this.customLeading,
    this.titleWidget,
    this.appIconWidth,
    this.appIconHeight,
    this.appTitlesize,
    this.leadingTitle,
    required this.rightNoification,
    this.isCentered,
    this.leadingCustomWidth,
    this.onDrawerTap,
    this.customactions,
    this.onTap,
  }) : super(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffFFFFFF),
          leadingWidth: leadingCustomWidth ?? 250.w,
          centerTitle: isCentered ?? false,
          title: titleWidget ?? Text(customTitle ?? ""),
          leading: InkWell(
            onTap: onTap,
            child: customLeading ??
                Row(
                  children: [
                    16.pw,
                    IconsContainer(
                      iconWidget: Builder(
                        builder: (context) {
                          return IconButton(
                            onPressed: onDrawerTap ??
                                () {
                                  Scaffold.of(context).openDrawer();
                                },
                            icon: const Icon(Icons.add),
                            // todo menu icon
                            // SvgPicture.asset(MyImages.menu),
                          );
                        },
                      ),
                    ),
                    16.pw,
                    rightNoification
                        ? const AppbarIconWidget()
                        : Text(
                            leadingTitle ?? "",
                            style: MainTextStyle.boldTextStyle(fontSize: 18),
                          ),
                  ],
                ),
          ),
          actions: customactions ??
              [
                Text(
                  "Eazifly",
                  style: GoogleFonts.plusJakartaSans().copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: appTitlesize ?? 25.69.sp,
                      color: const Color(0xff07070D)),
                ),
                9.pw,
                SvgPicture.asset(
                  Assets.iconsAppLogo,
                  fit: BoxFit.scaleDown,
                  width: appIconWidth ?? 30.w,
                  height: appIconHeight ?? 30.h,
                ),
                16.pw,
              ],
        );
}

class AppbarIconWidget extends StatelessWidget {
  final Widget? iconWidget;
  final Color? iconColor;
  final Function()? onTap;
  final Color? backgroundColor;
  final double? width;

  const AppbarIconWidget({
    super.key,
    this.iconWidget,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: backgroundColor ?? MainColors.inputFill,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: iconWidget ??
            Icon(
              Icons.add,
              color: iconColor,
            ),
      ),
    );
  }
}
