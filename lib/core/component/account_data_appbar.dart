import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountDataAppbar extends CustomAppBar {
  final BuildContext customContext;
  AccountDataAppbar({super.key, required this.customContext})
    : super(
        customContext,
        mainTitle: "معلومات الحساب",
        leadingText: "الاعدادات",
        isCenterTitle: true,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: const AppbarIconWidget(iconWidget: Icon(Icons.edit)),
          ),
        ],
        leadingIcon: Icons.arrow_back_ios,
      );
}
