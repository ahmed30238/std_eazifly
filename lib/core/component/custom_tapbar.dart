import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabBar extends StatelessWidget {
  final List<Widget> tabs;
  const CustomTabBar({
    super.key,
    required this.controller,
    required this.tabs,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.only(right: 28.w),
        color: MainColors.veryLightGrayFormField,
        width: double.infinity,
        height: 52.h,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: controller,
          indicatorWeight: 1,
          dividerColor: MainColors.transparentColor,
          tabAlignment: TabAlignment.start,
          // labelColor: Colors.red,
          isScrollable: true,
          labelPadding: EdgeInsets.only(
            left: 24.w,
            top: 16.h,
            bottom: 16.h,
          ),
          // unselectedLabelColor: Colors.red,
          indicatorColor: MainColors.blueTextColor,
          tabs: tabs,
        ),
      ),
    );
  }
}
