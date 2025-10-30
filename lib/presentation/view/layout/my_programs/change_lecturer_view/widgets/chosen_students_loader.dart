import 'package:eazifly_student/core/component/shimmer_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChosenStudentLoader extends StatelessWidget {
  const ChosenStudentLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: 80.w,
            height: 98.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: const ShimmerWidget(),
          );
        },
        separatorBuilder: (context, index) => 8.pw,
        itemCount: 3, // Show 3 loading placeholders
      ),
    );
  }
}
