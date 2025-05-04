import 'package:eazifly_student/presentation/controller/corrected_quiz_controller/correctedquiz_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class MultipleChoiceStudentAnswer extends StatelessWidget {
  const MultipleChoiceStudentAnswer({
    super.key,
    required this.cubit,
    required this.answerState,
    required this.choicesText,
  });

  final CorrectedquizCubit cubit;
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
                            ? MainColors.lightblue
                            : MainColors.lightRed
                        : MainColors.white,
                    borderRadius: 8.cr,
                    border: Border.all(
                      width: 2.w,
                      color: isSelected
                          ? answerState
                              ? MainColors.lightblue
                              : MainColors.red
                          : MainColors.grayBorderColor,
                    ),
                  ),
                  child: Text(
                    choicesText?[index] ?? "",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? answerState
                              ? MainColors.blueTextColor
                              : MainColors.red
                          : MainColors.black,
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
                color: MainColors.checkBoxBorderGray,
              ),
            ),
            12.ph,
            Container(
              width: 76.75.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: MainColors.lightgreenTeal,
                borderRadius: 8.cr,
                border: Border.all(
                  width: 2.w,
                  color: MainColors.greenTeal,
                ),
              ),
              child: Text(
                "المريخ",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.greenTeal,
                ),
              ).center(),
            )
          }
        ],
      ),
    );
  }
}
