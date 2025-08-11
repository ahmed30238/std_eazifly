import 'package:eazifly_student/presentation/view/lecture/quiz_details_view/widgets/answer_field_area.dart';
import 'package:eazifly_student/presentation/view/lecture/quiz_details_view/widgets/q_type_texted_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class QuestionContainer extends StatelessWidget {
  final String qType;
  final String question;
  final int optionsLength;
  final int index;
  final List<String> qOptions;

  const QuestionContainer({
    super.key,
    required this.qType,
    required this.question,
    required this.index,
    required this.qOptions,
    required this.optionsLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      height: qType == "مقالي" ? 186.h : 222.h,
      width: double.infinity,
      color: MainColors.inputFill,
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
                  color: MainColors.borderPrimary,
                ),
              ),
              QTypeTextedContainer(type: qType),
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
            "الاجابة",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
              color: MainColors.borderPrimary,
            ),
          ),
          8.ph,
          AnswerFieldArea(
            optionsLength: optionsLength,
            type: qType,
            qIndex: index,
            choicesText: qOptions,
          ),
        ],
      ),
    );
  }
}
