import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class MultipleChoiceStudentAnswer extends StatelessWidget {
  const MultipleChoiceStudentAnswer({
    super.key,
    required this.cubit,
    required this.answerState,
    required this.choicesText,
  });

  final LecturequizCubit cubit;
  final bool answerState;
  final List<String>? choicesText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 343.w,
            height: 44.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                bool isSelected = index == 1;
                return Container(
                  width: 76.75.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? answerState
                            ? MainColors.surface
                            : MainColors.error
                        : MainColors.background,
                    borderRadius: 8.cr,
                    border: Border.all(
                      width: 2.w,
                      color: isSelected
                          ? answerState
                              ? MainColors.surface
                              : MainColors.onError
                          : MainColors.outline,
                    ),
                  ),
                  child: Text(
                    choicesText?[index] ?? "",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? answerState
                              ? MainColors.primary
                              : MainColors.onError
                          : MainColors.onPrimary,
                    ),
                  ).center(),
                );
              },
              separatorBuilder: (context, index) => 12.pw,
              itemCount: 4,
            ),
          ),
          if (!answerState) ...{
            12.ph,
            Text(
              "الاجابة الصحيحة",
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
                color: MainColors.borderPrimary,
              ),
            ),
            12.ph,
            Container(
              width: 76.75.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: MainColors.onSuccess,
                borderRadius: 8.cr,
                border: Border.all(
                  width: 2.w,
                  color: MainColors.success,
                ),
              ),
              child: Text(
                "المريخ",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.success,
                ),
              ).center(),
            )
          }
        ],
      ),
    );
  }
}
