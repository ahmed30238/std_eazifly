import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LibraryFavouriteListItemShimmer extends StatelessWidget {
  // final int index;
  const LibraryFavouriteListItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: Container(
        padding: EdgeInsets.all(8.r),
        height: 96.h,
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
        ),
        child: Row(
          children: [
            // Image placeholder
            Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 12.h,
                      width: 140.w,
                      color: Colors.grey[300],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 12.h,
                          width: 40.w,
                          color: Colors.grey[300],
                        ),
                        SizedBox(width: 16.w),
                        Container(
                          height: 12.h,
                          width: 30.w,
                          color: Colors.grey[300],
                        ),
                        SizedBox(width: 16.w),
                        Container(
                          height: 12.h,
                          width: 30.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              height: 24.h,
              width: 24.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FavItemShimmerList extends StatelessWidget {
  const FavItemShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const LibraryFavouriteListItemShimmer(),
      separatorBuilder: (context, index) => 24.ph,
      itemCount: 4,
    );
  }
}
