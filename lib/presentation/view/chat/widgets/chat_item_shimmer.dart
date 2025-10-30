import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChatItemShimmerList extends StatelessWidget {
  const ChatItemShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 8,
        separatorBuilder: (context, index) => SeparatedWidget(
          dividerColor: MainColors.surfaceVariant,
          verticalPadding: 8.h,
        ),
        itemBuilder: (context, index) {
          return const ChatItemShimmer();
        },
      ),
    );
  }
}

class ChatItemShimmer extends StatelessWidget {
  const ChatItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: 72.h,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 48.w,
                  height: 48.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(),
                  ),
                  child: const ShimmerWidget(),
                ),
                12.pw,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 100.w,
                            height: 20.h,
                            child: const ShimmerWidget(),
                          ),
                          SizedBox(
                            width: 50.w,
                            height: 20.h,
                            child: const ShimmerWidget(),
                          ),
                        ],
                      ),
                      4.ph,
                      SizedBox(
                        height: 30.h,
                        width: 160.w,
                        child: const ShimmerWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Divider(
        //   thickness: 1,
        //   color: MainColors.lightGray,
        // )
      ],
    );
  }
}
