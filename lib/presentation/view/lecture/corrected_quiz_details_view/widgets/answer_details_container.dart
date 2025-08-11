import 'dart:developer';

import 'package:eazifly_student/data/models/my_programs/quizzes/get_quiz_questions_model.dart';
import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_state.dart';
import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/widgets/answer_state_container.dart';
import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/widgets/essay_student_answer.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

// Enhanced AnswerDetailsContainer
class AnswerDetailsContainer extends StatelessWidget {
  final String qState;
  final String question;
  final String answerText;
  final String qType;
  final bool answerState;
  final int index;
  final GetQuizQuestionsQuestionModel? questionData;
  final GetQuizQuestionsQuestionAnswerModel? questionAnswer;

  const AnswerDetailsContainer({
    super.key,
    required this.qState,
    required this.question,
    required this.answerState,
    required this.qType,
    required this.answerText,
    required this.index,
    this.questionData,
    this.questionAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MainColors.surfaceVariant,
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
                  color: MainColors.borderPrimary,
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
              color: MainColors.borderPrimary,
            ),
          ),
          12.ph,
          EnhancedStudentAnswerWidget(
            type: qType,
            essayAnswer: questionData?.type == 'text'
                ? questionAnswer?.answer?.toString()
                : null,
            answerState: answerState,
            choicesText: questionData?.options
                ?.map((option) => option.title ?? "")
                .toList(),
            questionData: questionData,
            questionAnswer: questionAnswer,
          ),
        ],
      ),
    );
  }
}

// Enhanced StudentAnswerWidget
class EnhancedStudentAnswerWidget extends StatelessWidget {
  final String type;
  final List<String>? choicesText;
  final String? essayAnswer;
  final bool answerState;
  final GetQuizQuestionsQuestionModel? questionData;
  final GetQuizQuestionsQuestionAnswerModel? questionAnswer;

  const EnhancedStudentAnswerWidget({
    super.key,
    required this.type,
    required this.answerState,
    this.choicesText,
    this.essayAnswer,
    this.questionData,
    this.questionAnswer,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = LecturequizCubit.get(context);

    switch (type) {
      case "مقالي":
        return EssayStudentAnswer(essayAnswer: essayAnswer);
      case "صح وخطأ":
        return EnhancedTrueFalseStudentAnswer(
          cubit: cubit,
          answerState: answerState,
          questionData: questionData,
          questionAnswer: questionAnswer,
        );
      case "أختيار من متعدد":
        return EnhancedMultipleChoiceStudentAnswer(
          cubit: cubit,
          answerState: answerState,
          choicesText: choicesText,
          questionData: questionData,
          questionAnswer: questionAnswer,
        );
      default:
        return TextedContainer(
          width: 117.w,
          height: 28.h,
          text: "نوع غير معرف",
          textColor: MainColors.onError,
          containerColor: MainColors.error,
          radius: 16.r,
        );
    }
  }
}

// Enhanced TrueFalseStudentAnswer
class EnhancedTrueFalseStudentAnswer extends StatelessWidget {
  const EnhancedTrueFalseStudentAnswer({
    super.key,
    required this.cubit,
    required this.answerState,
    this.questionData,
    this.questionAnswer,
  });

  final LecturequizCubit cubit;
  final bool answerState;
  final GetQuizQuestionsQuestionModel? questionData;
  final GetQuizQuestionsQuestionAnswerModel? questionAnswer;

  @override
  Widget build(BuildContext context) {
    final selectedOptionId =
        int.tryParse(questionAnswer?.questionOptionId ?? "0");
    final selectedOptionTitle = questionData?.options
        ?.firstWhere(
          (option) => option.id == selectedOptionId,
          orElse: () => GetQuizQuestionsOptionModel(),
        )
        .title;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 343.w,
          height: 44.h,
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              String optionText = index == 0 ? "صح" : "خطأ";
              bool isSelected = selectedOptionTitle == optionText;

              return Container(
                width: 165.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: isSelected
                      ? (answerState
                          ? MainColors.onSuccess
                          : MainColors.error)
                      : MainColors.background,
                  borderRadius: 8.cr,
                  border: Border.all(
                    width: 2.w,
                    color: isSelected
                        ? (answerState ? MainColors.success : MainColors.onError)
                        : MainColors.outline,
                  ),
                ),
                child: Text(
                  optionText,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? (answerState ? MainColors.success : MainColors.onError)
                        : MainColors.onPrimary,
                  ),
                ).center(),
              );
            },
            separatorBuilder: (context, index) => 12.pw,
            itemCount: 2,
          ),
        ),
        if (!answerState) ...[
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
            width: 165.w,
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
              _getCorrectAnswer(),
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.success,
              ),
            ).center(),
          ),
        ],
      ],
    );
  }

  String _getCorrectAnswer() {
    final correctOption = questionData?.options?.firstWhere(
      (option) => option.optionStatus == "correct",
      orElse: () => GetQuizQuestionsOptionModel(),
    );
    return correctOption?.title ?? "صح";
  }
}

class EnhancedMultipleChoiceStudentAnswer extends StatelessWidget {
  const EnhancedMultipleChoiceStudentAnswer({
    super.key,
    required this.cubit,
    required this.answerState,
    required this.choicesText,
    this.questionData,
    this.questionAnswer,
  });

  final LecturequizCubit cubit;
  final bool answerState;
  final List<String>? choicesText;
  final GetQuizQuestionsQuestionModel? questionData;
  final GetQuizQuestionsQuestionAnswerModel? questionAnswer;

  @override
  Widget build(BuildContext context) {
    final selectedOptionId =
        int.tryParse(questionAnswer?.questionOptionId ?? "0");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 343.w,
          height: 44.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final option = questionData?.options?[index];
              bool isSelected = option?.id == selectedOptionId;

              return Container(
                width: 76.75.w,
                height: 44.h,
                decoration: BoxDecoration(
                  color: isSelected
                      ? (answerState
                          ? MainColors.onSuccess
                          : MainColors.error)
                      : MainColors.background,
                  borderRadius: 8.cr,
                  border: Border.all(
                    width: 2.w,
                    color: isSelected
                        ? (answerState ? MainColors.success : MainColors.onError)
                        : MainColors.outline,
                  ),
                ),
                child: Text(
                  option?.title ?? choicesText?[index] ?? "",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? (answerState ? MainColors.success : MainColors.onError)
                        : MainColors.onPrimary,
                  ),
                ).center(),
              );
            },
            separatorBuilder: (context, index) => 12.pw,
            itemCount:
                questionData?.options?.length ?? choicesText?.length ?? 0,
          ),
        ),
        if (!answerState) ...[
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
              _getCorrectAnswer(),
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.success,
              ),
            ).center(),
          ),
        ],
      ],
    );
  }

  String _getCorrectAnswer() {
    final correctOption = questionData?.options?.firstWhere(
      (option) => option.optionStatus == "correct",
      orElse: () => GetQuizQuestionsOptionModel(),
    );
    return correctOption?.title ?? "الإجابة الصحيحة";
  }
}

class CorrectedQuizDetailsView extends StatefulWidget {
  final int programId;
  final int quizId;
  final int userId;
  final String quizTitle;
  const CorrectedQuizDetailsView({
    super.key,
    required this.programId,
    required this.quizId,
    required this.userId,
    required this.quizTitle,
  });

  @override
  State<CorrectedQuizDetailsView> createState() =>
      _CorrectedQuizDetailsViewState();
}

class _CorrectedQuizDetailsViewState extends State<CorrectedQuizDetailsView> {
  late LecturequizCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = LecturequizCubit.get(context);
    cubit.getQuizQuestions(
      quizId: widget.quizId,
      programId: widget.programId,
      userId: widget.userId,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: widget.quizTitle,
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: BlocBuilder<LecturequizCubit, LecturequizState>(
        bloc: cubit,
        builder: (context, state) {
          if (cubit.getQuizQuestionsLoader) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetQuizQuestionsErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style: MainTextStyle.mediumTextStyle(
                  fontSize: 14,
                  color: MainColors.onError,
                ),
              ),
            );
          }

          if (cubit.getQuizQuestionsEntity?.data == null) {
            return const Center(child: Text("لا توجد بيانات"));
          }

          final quizData = cubit.getQuizQuestionsEntity!.data!;
          final userAnswer = quizData.userAnswer;
          final questions = quizData.questions ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.ph,
              StudentStats(
                horizontalPadding: 0,
                titleText: const [
                  "تاريخ التسليم",
                  "درجة الإمتحان",
                  "حالة الإمتحان"
                ],
                downSideWidgets: [
                  Text(
                    _formatDate(quizData.createdAt),
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onSecondary,
                    ),
                  ),
                  Text(
                    "${userAnswer?.totalMark ?? "0"} / ${userAnswer?.fullMark ?? "100"}",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.onSecondary,
                    ),
                  ),
                  TextedContainer(
                    width: 63.w,
                    height: 26.h,
                    text: _getStatusText(
                      int.tryParse(userAnswer?.totalMark ?? "0"),
                      int.tryParse(userAnswer?.fullMark ?? "0"),
                    ),
                    textColor: _getStatusColor(
                      int.tryParse(userAnswer?.totalMark ?? "0"),
                      int.tryParse(userAnswer?.fullMark ?? "0"),
                    ),
                    containerColor: _getStatusBackgroundColor(
                      int.tryParse(userAnswer?.totalMark ?? "0"),
                      int.tryParse(userAnswer?.fullMark ?? "0"),
                    ),
                    radius: 55.r,
                  ),
                ],
              ),
              16.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "تفاصيل الإجابات",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
              ),
              8.ph,
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final question = questions[index];
                    final questionAnswer = _getQuestionAnswer(
                      userAnswer?.questionAnswer,
                      question.id,
                    );

                    return AnswerDetailsContainer(
                      answerState: _isAnswerCorrect(questionAnswer, question),
                      qType: _getQuestionTypeInArabic(question.type),
                      index: index,
                      answerText: _getAnswerText(question, questionAnswer),
                      qState: _isAnswerCorrect(questionAnswer, question)
                          ? "إجابة صحيحة"
                          : "إجابة خطأ",
                      question: question.title ?? "السؤال غير متاح",
                      questionData: question,
                      questionAnswer: questionAnswer,
                    );
                  },
                  separatorBuilder: (context, index) => 8.ph,
                  itemCount: questions.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "غير محدد";
    return "${date.year} - ${date.month} - ${date.day}";
  }

  // Updated method to calculate status based on marks
  String _getStatusText(int? totalMark, int? fullMark) {
    if (totalMark == null || fullMark == null) {
      log("message");
      return "غير محدد";
    }
    
    double percentage = (totalMark / fullMark) * 100;
    return percentage >= 50 ? "ناجح" : "راسب";
  }

  // Updated method to calculate color based on marks
  Color _getStatusColor(int? totalMark, int? fullMark) {
    if (totalMark == null || fullMark == null || fullMark == 0) {
      return MainColors.borderPrimary;
    }
    
    double percentage = (totalMark / fullMark) * 100;
    return percentage >= 50 ? MainColors.success : MainColors.onError;
  }

  // Updated method to calculate background color based on marks
  Color _getStatusBackgroundColor(int? totalMark, int? fullMark) {
    if (totalMark == null || fullMark == null || fullMark == 0) {
      return MainColors.surfaceVariant;
    }
    
    double percentage = (totalMark / fullMark) * 100;
    return percentage >= 50 ? MainColors.onSuccess : MainColors.error;
  }

  String _getQuestionTypeInArabic(String? type) {
    switch (type) {
      case 'text':
        return "مقالي";
      case 'true_false':
        return "صح وخطأ";
      case 'multiple_choice':
        return "أختيار من متعدد";
      default:
        return "نوع غير معرف";
    }
  }

  GetQuizQuestionsQuestionAnswerModel? _getQuestionAnswer(
    List<GetQuizQuestionsQuestionAnswerModel>? questionAnswers,
    int? questionId,
  ) {
    if (questionAnswers == null || questionId == null) return null;

    try {
      return questionAnswers.firstWhere(
        (answer) => int.parse(answer.questionId ?? "0") == questionId,
      );
    } catch (e) {
      return null;
    }
  }

  bool _isAnswerCorrect(
    GetQuizQuestionsQuestionAnswerModel? questionAnswer,
    GetQuizQuestionsQuestionModel? question,
  ) {
    // للأسئلة المقالية: نعتمد على المارك
    if (question?.type == 'text') {
      final mark = int.tryParse(questionAnswer?.mark ?? "");
      return mark != null && mark > 0;
    }

    // لأسئلة صح/خطأ والاختيار المتعدد: نقارن IDs
    if (question?.type == 'true_false' || question?.type == 'multiple_choice') {
      final selectedOptionId =
          int.tryParse(questionAnswer?.questionOptionId ?? "");
      final correctOption = question?.options
          ?.firstWhere((option) => option.optionStatus == "correct");
      return correctOption?.id == selectedOptionId;
    }
    return false;
  }

  String _getAnswerText(
    GetQuizQuestionsQuestionModel question,
    GetQuizQuestionsQuestionAnswerModel? questionAnswer,
  ) {
    if (questionAnswer == null) return "لا توجد إجابة";

    switch (question.type) {
      case 'text':
        return questionAnswer.answer?.toString() ?? "لا توجد إجابة";
      case 'true_false':
      case 'multiple_choice':
        final selectedOptionId =
            int.tryParse(questionAnswer.questionOptionId ?? "0");
        if (selectedOptionId != null) {
          final selectedOption = question.options?.firstWhere(
            (option) => option.id == selectedOptionId,
            orElse: () => GetQuizQuestionsOptionModel(),
          );
          return selectedOption?.title ?? "لا توجد إجابة";
        }
        return "لا توجد إجابة";
      default:
        return "نوع سؤال غير معروف";
    }
  }
}