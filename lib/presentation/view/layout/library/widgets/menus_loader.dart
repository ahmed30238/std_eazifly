import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:shimmer/shimmer.dart';

class LibraryMenuListItemShimmer extends StatelessWidget {
  final int index;
  const LibraryMenuListItemShimmer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: Container(
        margin: EdgeInsets.only(
          right: 16.w,
          left: 16.w,
          top: index == 0 ? 16.h : 0,
          bottom: index == 5
              ? 16.h
              : 0, // أو استخدم list.length - 1 في مكان الاستدعاء
        ),
        padding: EdgeInsets.all(8.r),
        height: 96.h,
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: 16.cr,
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              height: 80.h,
              width: 80.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            8.pw,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 12.h,
                      width: 120.w,
                      color: Colors.grey[300],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 14.h,
                          width: 60.w,
                          color: Colors.grey[300],
                        ),
                        16.pw,
                        Container(
                          height: 14.h,
                          width: 40.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12.sp,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuListShimmer extends StatelessWidget {
  const MenuListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return LibraryMenuListItemShimmer(
          index: index,
        );
      },
      separatorBuilder: (context, index) => 12.ph,
      itemCount: 6,
      physics: const BouncingScrollPhysics(),
    );
  }
}
