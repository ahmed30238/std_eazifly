import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class TrueFalseStudentAnswer extends StatelessWidget {
  const TrueFalseStudentAnswer({
    super.key,
    required this.cubit,
  });

  final LecturequizCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => SizedBox(
        width: 343.w,
        height: 44.h,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isSelected = index == 0;
            return Container(
              width: 165.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: isSelected ? MainColors.lightblue : MainColors.white,
                borderRadius: 8.cr,
                border: Border.all(
                  width: 2.w,
                  color: isSelected
                      ? MainColors.blueTextColor
                      : MainColors.grayBorderColor,
                ),
              ),
              child: Text(
                index == 0 ? "صح" : "خطأ",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: isSelected
                      ? MainColors.blueTextColor
                      : MainColors.black,
                ),
              ).center(),
            );
          },
          separatorBuilder: (context, index) => 12.pw,
          itemCount: 2,
        ),
      ),
    );
  }
}