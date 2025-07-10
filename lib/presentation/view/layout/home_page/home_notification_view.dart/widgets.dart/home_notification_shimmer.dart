import 'package:eazifly_student/core/component/icons_container.dart';
import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class HomeNotificationItemShimmer extends StatelessWidget {
  const HomeNotificationItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: 84.h,
          child: SizedBox(
            height: 60.h,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconsContainer(
                  width: 40.w,
                  height: 40.h,
                  iconWidget: const ShimmerWidget(),
                ),
                8.pw,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 295.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 20.h,
                              width: 70.w,
                              child: const ShimmerWidget(),
                            ),
                            SizedBox(
                              height: 20.h,
                              width: 70.w,
                              child: const ShimmerWidget(),
                            ),
                          ],
                        ),
                      ),
                      4.ph,
                      SizedBox(
                        height: 20.h,
                        width: 180.w,
                        child: const ShimmerWidget(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const CustomHorizontalDivider(
          thickness: 1,
        ),
      ],
    );
  }
}

class NotificationShimmerList extends StatelessWidget {
  const NotificationShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: ListView.builder(
        padding: EdgeInsets.only(top: 16.h),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const HomeNotificationItemShimmer();
        },
        itemCount: 8,
      ),
    );
  }
}
