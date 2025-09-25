import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFilledTabBar extends StatelessWidget {
  final TabController controller;
  final BorderRadiusGeometry? outerRadius;
  final double? innerRadius;
  final void Function(int)? onTap;
  final EdgeInsetsGeometry? margin;
  final List<Widget> tabs;
  const CustomFilledTabBar({
    super.key,
    required this.controller,
    this.innerRadius,
    this.outerRadius,
    this.margin,
    required this.onTap,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 16.w),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: MainColors.surface,
        borderRadius: outerRadius ?? 25.cr,
      ),
      height: 44.h,
      width: 343.w,
      child: TabBar(
        controller: controller,
        onTap: onTap,
        dividerColor: Colors.transparent,

        unselectedLabelStyle: const TextStyle(color: Colors.black),
        labelColor: Colors.white,
        isScrollable: false,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        indicatorColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: MainColors.primary,
          borderRadius: BorderRadius.circular(innerRadius ?? 25.r),
        ),
        tabs: tabs,
      ),
    );
  }
}
