import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:shimmer/shimmer.dart';

class AudiosLoaderShimmer extends StatelessWidget {
  const AudiosLoaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 2, // or more shimmer cards
        separatorBuilder: (context, index) => 12.pw,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: const Color(0xFFE0E0E0),
            highlightColor: const Color(0xFFF5F5F5),
            child: Container(
              height: 220.h,
              width: 197.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: 12.cr,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  16.ph,
                  Container(
                    height: 131.h,
                    width: 165.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: 8.cr,
                    ),
                  ),
                  8.ph,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 12.h,
                          width: 100.w,
                          color: Colors.grey[300],
                        ),
                        12.ph,
                        Row(
                          children: List.generate(3, (i) {
                            return Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    height: 16.h,
                                    width: 16.w,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  4.pw,
                                  Container(
                                    height: 10.h,
                                    width: 30.w,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class AudioShimmerList extends StatelessWidget {
  const AudioShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
            width: 300.w,
            child: const ShimmerWidget(),
          ),
          8.ph,
          const AudiosLoaderShimmer(),
        ],
      ),
      separatorBuilder: (context, index) => 24.ph,
      itemCount: 2,
    );
  }
}
