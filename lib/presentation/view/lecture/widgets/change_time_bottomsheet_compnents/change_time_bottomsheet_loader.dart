import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/theme/text_styles.dart/styles.dart';
import '../../../layout/my_account/notifications_view/notification_view.dart';

class ChangeTimeBottomSheetShimmerLoader extends StatelessWidget {
  const ChangeTimeBottomSheetShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetDesign(
      widget: Column(
        children: [
          16.ph,
          Text(
            "برجاء تحديد الموعد الجديد",
            style: MainTextStyle.boldTextStyle(fontSize: 14.sp),
          ),
          32.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  "اليوم",
                  style: MainTextStyle.boldTextStyle(fontSize: 12.sp),
                ),
                8.pw,
                Expanded(
                  child: ShimmerContainer(height: 50.h, borderRadius: 12.r),
                ),
              ],
            ),
          ),
          20.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  "الوقت",
                  style: MainTextStyle.boldTextStyle(fontSize: 12.sp),
                ),
                8.pw,
                Expanded(
                  child: ShimmerContainer(height: 50.h, borderRadius: 12.r),
                ),
              ],
            ),
          ),
          const Spacer(),
          // Button Shimmer
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ShimmerContainer(height: 48.h, borderRadius: 16.r),
          ),
          16.ph,
        ],
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  final double? width;
  final double height;
  final double borderRadius;

  const ShimmerContainer({
    super.key,
    this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFeaeaea),
      highlightColor: const Color(0xFFF8F8F8),
      period: const Duration(milliseconds: 1000),
      direction: ShimmerDirection.rtl,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: const Color(0xFFffffff),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
