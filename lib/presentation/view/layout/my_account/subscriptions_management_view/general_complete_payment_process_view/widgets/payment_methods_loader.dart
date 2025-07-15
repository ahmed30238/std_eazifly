import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:shimmer/shimmer.dart';

class PaymentMethodContainerShimmer extends StatelessWidget {
  final bool showIcon;

  const PaymentMethodContainerShimmer({super.key, this.showIcon = true});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFE0E0E0),
      highlightColor: const Color(0xFFF5F5F5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        height: 119.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: 16.cr,
          border: Border.all(color: MainColors.lightGray),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showIcon)
              Container(
                height: 32.h,
                width: 32.w,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            if (showIcon) 12.pw,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 14.h,
                    width: 120.w,
                    color: Colors.grey[300],
                  ),
                  8.ph,
                  Container(
                    height: 10.h,
                    width: 180.w,
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


