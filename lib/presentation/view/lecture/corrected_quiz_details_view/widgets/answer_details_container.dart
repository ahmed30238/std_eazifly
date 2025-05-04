import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/widgets/answer_state_container.dart';
import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/widgets/student_answer_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AnswerDetailsContainer extends StatelessWidget {
  final String qState;
  final String question;
  final String answerText;
  final String qType;
  final bool answerState;
  final int index;

  const AnswerDetailsContainer({
    super.key,
    required this.qState,
    required this.question,
    required this.answerState,
    required this.qType,
    required this.answerText,
    required this.index,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MainColors.lightGray,
          ),
        ),
      ),
      constraints: BoxConstraints(minHeight: 190.h),
      width: double.infinity,
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "السؤال ${index + 1}",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 14,
                  color: MainColors.checkBoxBorderGray,
                ),
              ),
              AnwerStateContainer(state: qState),
            ],
          ),
          8.ph,
          Container(
            padding: EdgeInsets.all(12.r),
            width: double.infinity,
            child: Text(
              question,
              style: MainTextStyle.mediumTextStyle(fontSize: 12),
            ),
          ),
          Text(
            "إجابتك",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
              color: MainColors.checkBoxBorderGray,
            ),
          ),
          12.ph,
          StudentAnswerWidget(
            type: qType,
            essayAnswer: "sadasdasdsadasdas",
            answerState: answerState,
            choicesText: const [
              "data",
              "data",
              "data",
              "data",
            ],
          ),
        ],
      ),
    );
  }
}
