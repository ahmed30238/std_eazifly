import 'package:eazifly_student/data/models/my_programs/quizzes/get_quiz_questions_model.dart';
import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_state.dart';
import 'package:eazifly_student/presentation/view/lecture/corrected_quiz_details_view/widgets/answer_details_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

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
                  "حالة الإمتحان",
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
                    text: _getStatusText(userAnswer?.status),
                    textColor: _getStatusColor(userAnswer?.status),
                    containerColor: _getStatusBackgroundColor(
                      userAnswer?.status,
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
                      answerState: _isAnswerCorrect(questionAnswer),
                      qType: _getQuestionTypeInArabic(question.type),
                      index: index,
                      answerText: _getAnswerText(question, questionAnswer),
                      qState: _isAnswerCorrect(questionAnswer)
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

  String _getStatusText(String? status) {
    switch (status?.toLowerCase()) {
      case 'pass':
      case 'passed':
        return "ناجح";
      case 'fail':
      case 'failed':
        return "راسب";
      default:
        return "غير محدد";
    }
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'pass':
      case 'passed':
        return MainColors.success;
      case 'fail':
      case 'failed':
        return MainColors.error;
      default:
        return MainColors.borderPrimary;
    }
  }

  Color _getStatusBackgroundColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'pass':
      case 'passed':
        return MainColors.onSuccess;
      case 'fail':
      case 'failed':
        return MainColors.error;
      default:
        return MainColors.surfaceVariant;
    }
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

  bool _isAnswerCorrect(GetQuizQuestionsQuestionAnswerModel? questionAnswer) {
    if (questionAnswer?.mark == null) return false;

    try {
      double mark = double.parse(questionAnswer!.mark!);
      return mark > 0;
    } catch (e) {
      return false;
    }
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
        final selectedOptionId = int.tryParse(
          questionAnswer.questionOptionId ?? "0",
        );
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
