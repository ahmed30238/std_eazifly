import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:shimmer/shimmer.dart';

class UnderReviewItemShimmer extends StatelessWidget {
  const UnderReviewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFeaeaea),
      highlightColor: const Color(0xFFF8F8F8),
      child: Container(
        height: 300.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: MainColors.surfaceVariant),
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
        ),
        child: Column(
          children: [
            // صورة و حالة الطلب
            Container(
              height: 180.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
              ),
            ),
            // معلومات البرنامج
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  Container(
                    height: 16.h,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 16.h,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 16.h,
                    width: 120.w,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnderReviewLoader extends StatelessWidget {
  const UnderReviewLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) {
          // var order = orders?[index];
          return const UnderReviewItemShimmer();
        },
        itemCount: 3,
        separatorBuilder: (context, index) => 24.ph,
      ),
    );
  }
}
