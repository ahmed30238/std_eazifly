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
  final List<bool> optionsCorrectness;
  final int? userSelectedOptionIndex;

  const CorrectedQuestionCotainer({
    super.key,
    required this.qType,
    required this.question,
    required this.index,
    required this.qOptions,
    required this.optionsLength,
    required this.isTrue,
    required this.essayAnswer,
    required this.isMultiTrue,
    required this.optionsCorrectness,
    this.userSelectedOptionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      width: double.infinity,
      decoration: BoxDecoration(
        color: MainColors.inputFill,
        borderRadius: 8.cr,
      ),
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
              TextedContainer(
                width: 117.w,
                height: 28.h,
                text: isTrue ? "إجابة صحيحة" : "إجابة خطأ",
                textColor: isTrue ? MainColors.success : MainColors.onError,
                containerColor: isTrue
                    ? MainColors.onSuccess
                    : MainColors.error,
                radius: 16.r,
              ),
            ],
          ),
          12.ph,
          Container(
            padding: EdgeInsets.all(12.r),
            width: double.infinity,
            decoration: BoxDecoration(
              color: MainColors.background,
              borderRadius: 8.cr,
              border: Border.all(width: 1.w, color: MainColors.outline),
            ),
            child: Text(
              question,
              style: MainTextStyle.mediumTextStyle(fontSize: 12),
            ),
          ),
          16.ph,
          Text(
            "إجابتك",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
              color: MainColors.borderPrimary,
            ),
          ),
          8.ph,
          CorrectedAnswerField(
            optionsLength: optionsLength,
            type: qType,
            qIndex: index,
            isMultiTrue: isMultiTrue,
            choicesText: qOptions,
            essayAnswer: essayAnswer,
            optionsCorrectness: optionsCorrectness,
            userSelectedOptionIndex: userSelectedOptionIndex,
          ),
        ],
      ),
    );
  }
}
