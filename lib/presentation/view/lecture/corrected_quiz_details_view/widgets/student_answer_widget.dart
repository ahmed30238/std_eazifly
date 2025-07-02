import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/widgets/essay_student_answer.dart';
import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/widgets/multible_choices_student_answer_widget.dart';
import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/widgets/true_false_student_answer_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentAnswerWidget extends StatelessWidget {
  final String type;
  final List<String>? choicesText;
  final String? essayAnswer;
  final bool answerState;
  const StudentAnswerWidget({
    super.key,
    required this.type,
    required this.answerState,
    this.choicesText,
    this.essayAnswer,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = LecturequizCubit.get(context);
    switch (type) {
      case "مقالي":
        return EssayStudentAnswer(essayAnswer: essayAnswer);
      case "صح وخطأ":
        return TrueFalseStudentAnswer(cubit: cubit);
      case "أختيار من متعدد":
        return MultipleChoiceStudentAnswer(
          cubit: cubit,
          answerState: answerState,
          choicesText: choicesText,
        );
      default:
        return TextedContainer(
          width: 117.w,
          height: 28.h,
          text: "نوع غير معرف",
          textColor: MainColors.red,
          containerColor: MainColors.lightRed,
          radius: 16.r,
        );
    }
  }
}
