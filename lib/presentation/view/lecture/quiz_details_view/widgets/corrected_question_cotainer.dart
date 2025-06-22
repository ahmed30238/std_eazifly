import 'package:eazifly_student/presentation/view/lecture/quiz_details_view/widgets/corrected_answer_field.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CorrectedQuestionCotainer extends StatelessWidget {
  final String qType;
  final String question;
  final String essayAnswer;
  final int optionsLength;
  final int index;
  final List<String> qOptions;
  final bool isMultiTrue;
  final bool isTrue;

  const CorrectedQuestionCotainer({
    super.key,
    required this.qType,
    required this.question,
    required this.index,
    required this.qOptions,
    required this.optionsLength,
    required this.isTrue, required this.essayAnswer, required this.isMultiTrue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      height: qType == "مقالي" ? 186.h : 222.h,
      width: double.infinity,
      color: MainColors.veryLightGrayFormField,
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
              TextedContainer(
                width: 117.w,
                height: 28.h,
                text: isTrue ? "اجابة صحيحة" : "اجابة خطأ",
                textColor: isTrue ? MainColors.greenTeal : MainColors.red,
                containerColor:
                    isTrue ? MainColors.lightgreenTeal : MainColors.lightRed,
                radius: 16.r,
              ),
              // QTypeTextedContainer(type: qType),
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
          8.ph,
          CorrectedAnswerField(
            optionsLength: optionsLength,
            type: qType,
            qIndex: index,
            isMultiTrue: isMultiTrue,
            choicesText: qOptions, essayAnswer: essayAnswer,
          ),
        ],
      ),
    );
  }
}
