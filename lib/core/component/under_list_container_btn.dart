
import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnderListContainer extends StatelessWidget {
  const UnderListContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainColors.background,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: 8.w,
          bottom: 32.h,
          right: 16.w,
          left: 16.w,
        ),
        child: CustomElevatedButton(
          text: "إرسال رسالة",
          onPressed: () {},
          color: MainColors.primary,
          radius: 16.r,
        ),
      ),
    );
  }
}