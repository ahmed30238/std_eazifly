import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:shimmer/shimmer.dart';

class TextedCheckboxLoader extends StatelessWidget {
  const TextedCheckboxLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 343.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: MainColors.white, // Use a solid color for shimmer
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Container(
              width: 20.w, // Adjust to match your checkbox size
              height: 20.h,
              decoration: const BoxDecoration(
                color: MainColors.white,
                shape: BoxShape.circle,
              ),
            ),
            12.pw,
            Container(
              width: 150.w, // Adjust width as needed for your text
              height: 16.h,
              decoration: BoxDecoration(
                color: MainColors.white,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextedCheckboxLoaderList extends StatelessWidget {
  const TextedCheckboxLoaderList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: ListView.separated(
        separatorBuilder: (context, index) => 16.ph,
        physics:
            const NeverScrollableScrollPhysics(), // Disable scrolling during loading
        shrinkWrap: true,
        itemCount: 5, // Number of shimmer items to show
        itemBuilder: (context, index) => const TextedCheckboxLoader(),
      ),
    );
  }
}
