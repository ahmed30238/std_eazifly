import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_state.dart';
import 'package:eazifly_student/presentation/view/lecture/quiz_details_view/widgets/question_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureQuizDetailsView extends StatefulWidget {
  final int programId;
  final int quizId;
  final int userId;
  final String quizTitle;
  const LectureQuizDetailsView({
    super.key,
    required this.programId,
    required this.quizId,
    required this.userId,
    required this.quizTitle,
  });

  @override
  State<LectureQuizDetailsView> createState() => _LectureQuizDetailsViewState();
}

class _LectureQuizDetailsViewState extends State<LectureQuizDetailsView> {
  late LecturequizCubit cubit;

  @override
  void initState() {
    cubit = context.read<LecturequizCubit>();
    super.initState();
    cubit.getQuizQuestions(
      programId: widget.programId,
      quizId: widget.quizId,
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
        builder: (context, state) {
          // Show loader while loading
          if (cubit.getQuizQuestionsLoader) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Check if quهz is corrected (has userAnswer)
          // bool isQuizCorrected =
          //     cubit.getQuizQuestionsEntity?.data?.userAnswer != null;

          // return isQuizCorrected
          //   ? CorrectedQuizBody(cubit: cubit, widget: widget)
          //   :
          return NotCorrectedQuizBody(cubit: cubit, widget: widget);
        },
      ),
    );
  }
}

class NotCorrectedQuizBody extends StatelessWidget {
  const NotCorrectedQuizBody({
    super.key,
    required this.cubit,
    required this.widget,
  });

  final LecturequizCubit cubit;
  final LectureQuizDetailsView widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.ph,
              BlocBuilder<LecturequizCubit, LecturequizState>(
                builder: (context, state) {
                  var quizData = cubit.getQuizQuestionsEntity?.data;

                  // Calculate total possible marks
                  double totalPossibleMarks = 0;
                  if (quizData?.questions != null) {
                    for (var question in quizData!.questions!) {
                      totalPossibleMarks +=
                          double.tryParse(question.mark ?? "0") ?? 0;
                    }
                  }

                  return StudentStats(
                    horizontalPadding: 0,
                    titleText: const [
                      "تاريخ الإنشاء",
                      "درجة الإمتحان",
                      "حالة الإمتحان"
                    ],
                    downSideWidgets: [
                      Text(
                        formatDate(quizData?.createdAt ?? DateTime.now())
                            .substring(0, 10),
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.blackText,
                        ),
                      ),
                      Text(
                        "${totalPossibleMarks.toStringAsFixed(0)} / ....",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.blackText,
                        ),
                      ),
                      TextedContainer(
                        width: 105.w,
                        height: 26.h,
                        text: quizData?.userAnswer != null ? "done" : "",
                        textColor: MainColors.yellow,
                        containerColor: MainColors.lightYellow,
                        radius: 16.r,
                      ),
                    ],
                  );
                },
              ),
              24.ph,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "الأسئلة",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
              ),
              8.ph,
              BlocBuilder<LecturequizCubit, LecturequizState>(
                builder: (context, state) {
                  var quizData = cubit.getQuizQuestionsEntity?.data;
                  var questions = quizData?.questions;
                  return Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(bottom: 16.h),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var question = questions?[index];
                        return Column(
                          children: [
                            QuestionContainer(
                              optionsLength: question?.options?.length ?? 4,
                              qOptions: question?.options
                                      ?.map((e) => e.title ?? "")
                                      .toList() ??
                                  [""],
                              qType: question?.type ?? "",
                              question: question?.title ?? "",
                              index: index,
                            ),
                            if (questions != null &&
                                index == questions.length - 1) ...[
                              16.ph,
                              CustomElevatedButton(
                                width: 344.w,
                                text: "تسليم الإجابات",
                                onPressed: cubit.submitQuizLoader
                                    ? () {}
                                    : () {
                                        cubit.submitQuiz(
                                          quizId: widget.quizId,
                                          qIndex: index,
                                          context: context,
                                        );
                                      },
                                radius: 16.r,
                                color: MainColors.blueTextColor,
                                child: cubit.submitQuizLoader
                                    ? const CircularProgressIndicator.adaptive()
                                    : null,
                              ),
                            ]
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => 12.ph,
                      itemCount: questions?.length ?? 0,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        32.ph,
      ],
    );
  }
}
