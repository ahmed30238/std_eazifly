import 'package:eazifly_student/presentation/view/layout/my_programs/selection_of_educational_courses_view/widgets/lecture_data_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class NextLectureDataContainer extends StatelessWidget {
  const NextLectureDataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
      height: 207.h,
      width: 343.w,
      decoration: BoxDecoration(
        color: MainColors.inputFill,
        borderRadius: 12.cr,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "بيانات المحاضرات القادمة",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          12.ph,
          SizedBox(
            height: 149.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const LectureDataContainer(),
              separatorBuilder: (context, index) => 8.pw,
              itemCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
