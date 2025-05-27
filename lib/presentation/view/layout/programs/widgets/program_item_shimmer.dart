import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramItemShimmer extends StatelessWidget {
  const ProgramItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MainColors.veryLightGrayFormField,
      constraints: BoxConstraints(minHeight: 250.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 163.h,
            width: double.infinity,
            child: const ShimmerWidget(),
          ),
          12.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              width: 100.w,
              height: 20.h,
              child: const ShimmerWidget(),
            ),
          ),
          4.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SizedBox(
              width: 300.w,
              height: 40.h,
              child: const ShimmerWidget(),
            ),
          ),
          12.ph,
        ],
      ),
    );
  }
}

class ProgramsShimmerLoader extends StatelessWidget {
  const ProgramsShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 16.h),
        itemBuilder: (context, index) => const ProgramItemShimmer(),
        separatorBuilder: (context, index) => 16.ph,
        itemCount: 3,
      ),
    );
  }
}
