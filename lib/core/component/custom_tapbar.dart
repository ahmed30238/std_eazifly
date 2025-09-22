import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final EdgeInsetsGeometry? padding;
  final Function(int)? onTap;
  final bool? isScrollable;
  final TabAlignment? tabAlignment;

  const CustomTabBar({
    super.key,
    required this.controller,
    required this.tabs,
    this.padding,
    this.onTap,
    this.isScrollable,
    this.tabAlignment,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: padding ?? EdgeInsets.only(right: 28.w),
        color: MainColors.inputFill,
        width: double.infinity,
        height: 52.h,
        child: TabBar(
          onTap: onTap,
          indicatorSize: TabBarIndicatorSize.label,
          controller: controller,
          indicatorWeight: 1,
          dividerColor: MainColors.transparent,
          // tabAlignment: TabAlignment.start,
          tabAlignment: tabAlignment ?? TabAlignment.center,
          // labelColor: Colors.red,
          isScrollable: isScrollable ?? false,
          labelPadding: EdgeInsets.only(left: 24.w, top: 16.h, bottom: 16.h),
          // unselectedLabelColor: Colors.red,
          indicatorColor: MainColors.primary,
          tabs: tabs,
        ),
      ),
    );
  }
}
