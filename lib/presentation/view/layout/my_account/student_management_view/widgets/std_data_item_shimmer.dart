import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:shimmer/shimmer.dart';

class StudentDataItemShimmer extends StatelessWidget {
  final double width;

  const StudentDataItemShimmer({super.key, this.width = 343});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8.w, left: 8.w, top: 12, bottom: 12),
      height: 65.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: 12.cr,
        color: MainColors.inputFill,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Shimmer for image
            Container(
              height: 45.h,
              width: 45.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            8.pw,
            // Shimmer for name and age
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 100.w, height: 16.h, color: Colors.white),
                8.ph,
                Container(width: 60.w, height: 14.h, color: Colors.white),
              ],
            ),
            20.pw,
            // Shimmer for phone
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 80.w, height: 14.h, color: Colors.white),
                8.ph,
                Container(width: 100.w, height: 16.h, color: Colors.white),
              ],
            ),
            const Spacer(),
            // Shimmer for trailing icon
            Container(width: 24.w, height: 24.h, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class StdDataItemShimmerList extends StatelessWidget {
  const StdDataItemShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemBuilder: (context, index) {
          return const StudentDataItemShimmer();
        },
        itemCount: 5, // Show 5 shimmer items
        separatorBuilder: (context, index) => 16.ph,
      ),
    );
  }
}
