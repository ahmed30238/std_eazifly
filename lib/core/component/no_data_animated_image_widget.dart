import 'package:eazifly_student/core/component/custom_animation.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoDataAnimatedImageWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String message;
  const NoDataAnimatedImageWidget({
    super.key,
    required this.message,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LottieBuilder.asset(
          height: height ?? 300.h,
          width: width ?? 300.w,
          CustomAnimation.noData,
        ),
        Text(
          message,
          style: MainTextStyle.boldTextStyle(
            fontSize: 16,
          ).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
