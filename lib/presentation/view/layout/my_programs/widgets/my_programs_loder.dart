import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:shimmer/shimmer.dart';

class ProgramItemShimmer extends StatelessWidget {
  const ProgramItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFeaeaea),
      highlightColor: const Color(0xFFF8F8F8),
      period: const Duration(milliseconds: 1000),
      direction: ShimmerDirection.rtl,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        constraints: BoxConstraints(minHeight: 300.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity, // تأخذ العرض المتاح
              height: 163.h,
              color: Colors.grey[300],
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200.w,
                    height: 20.h,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 4.h),
                  Container(
                    width: double.infinity,
                    height: 16.h,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 4.h),
                  Container(height: 1.h, color: Colors.grey[300]),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80.w,
                            height: 16.h,
                            color: Colors.grey[300],
                          ),
                          SizedBox(height: 4.h),
                          Container(
                            width: 120.w,
                            height: 14.h,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80.w,
                            height: 16,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 120.w,
                            height: 14,
                            color: Colors.grey[300],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.grey[300],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}

class MyProgramsLoader extends StatelessWidget {
  const MyProgramsLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4, // عدد العناصر
      separatorBuilder: (context, index) => 16.ph, // المسافة بين العناصر
      itemBuilder: (context, index) {
        return const ProgramItemShimmer(); // عنصر الشيمر
      },
    );
  }
}
