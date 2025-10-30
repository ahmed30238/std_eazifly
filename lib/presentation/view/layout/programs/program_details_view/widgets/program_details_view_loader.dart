import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramDetailsViewLoader extends StatelessWidget {
  const ProgramDetailsViewLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.ph,
              SizedBox(
                height: 188.h,
                width: double.infinity,
                child: const ShimmerWidget(),
              ),
              16.ph,
              SizedBox(
                height: 29.h,
                width: 100.w,
                child: const ShimmerWidget(),
              ),
              8.ph,
              SizedBox(
                height: 58.h,
                width: 300.w,
                child: const ShimmerWidget(),
              ),
              16.ph,
              SizedBox(
                height: 48.h,
                width: 375.w,
                child: const ShimmerWidget(),
              ),
              2.ph,
              SizedBox(height: 348.h, child: const ShimmerWidget()),
            ].itemPadding(rightPadding: 16.w, leftPadding: 16.w),
          ),
        ],
      ),
    );
  }
}
