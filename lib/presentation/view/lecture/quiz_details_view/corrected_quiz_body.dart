import 'package:eazifly_student/data/models/my_programs/quizzes/get_quiz_questions_model.dart';
import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture_quiz_details_controller/lecturequiz_state.dart';
import 'package:eazifly_student/presentation/view/lecture/quiz_details_view/quiz_details_view.dart';
import 'package:eazifly_student/presentation/view/lecture/quiz_details_view/widgets/corrected_question_cotainer.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CorrectedQuizBody extends StatelessWidget {
  const CorrectedQuizBody({
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
                  // Show loader while loading
                  if (cubit.getQuizQuestionsLoader) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  var quizData = cubit.getQuizQuestionsEntity?.data;

                  // Handle null or empty data
                  if (quizData == null) {
                    return const SizedBox.shrink();
                  }

                  // Parse marks safely
                  double totalMark =
                      double.tryParse(quizData.userAnswer?.totalMark ?? "0") ??
                          0;
                  double fullMark =
                      double.tryParse(quizData.userAnswer?.fullMark ?? "0") ??
                          0;

                  // Calculate pass/fail status
                  bool isPassed = fullMark > 0 && totalMark >= (fullMark / 2);

                  return StudentStats(
                    horizontalPadding: 0,
                    titleText: const [
                      "تاريخ التسليم",
                      "درجة الإمتحان",
                      "حالة الإمتحان"
                    ],
                    downSideWidgets: [
                      Text(
                        formatDate(quizData.createdAt ?? DateTime.now())
                            .substring(0, 10),
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.blackText,
                        ),
                      ),
                      Text(
                        "${totalMark.toStringAsFixed(0)} / ${fullMark.toStringAsFixed(0)}",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                          color: MainColors.blackText,
                        ),
                      ),
                      TextedContainer(
                        width: 105.w,
                        height: 26.h,
                        text: isPassed ? "ناجح" : "راسب",
                        textColor:
                            isPassed ? MainColors.greenTeal : MainColors.red,
                        containerColor: isPassed
                            ? MainColors.lightgreenColor
                            : MainColors.lightRed,
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
                  "تفاصيل الإجابات",
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
                        var userAnswer =
                            quizData?.userAnswer?.questionAnswer?[index];

                        // تحديد ما إذا كان المستخدم قد اختار الإجابة الصحيحة
                        bool isUserAnswerCorrect = false;
                        List<bool> optionsCorrectness = [];
                        int? userSelectedOptionIndex;

                        if (question?.type == "multiple_choice") {
                          // إنشاء قائمة بصحة كل خيار
                          optionsCorrectness = question?.options?.map((option) => 
                            option.optionStatus == "correct"
                          ).toList() ?? [];
                          
                          // العثور على فهرس الخيار الذي اختاره المستخدم
                          userSelectedOptionIndex = question?.options?.indexWhere((option) => 
                            option.id?.toString() == userAnswer?.questionOptionId?.toString()
                          );
                          
                          if (userSelectedOptionIndex != null && userSelectedOptionIndex >= 0) {
                            isUserAnswerCorrect = optionsCorrectness[userSelectedOptionIndex];
                          }
                          
                        } else if (question?.type == "true_false") {
                          // للأسئلة صح وخطأ
                          optionsCorrectness = question?.options?.map((option) => 
                            option.optionStatus == "correct"
                          ).toList() ?? [];
                          
                          // العثور على فهرس الخيار الذي اختاره المستخدم
                          userSelectedOptionIndex = question?.options?.indexWhere((option) => 
                            option.id?.toString() == userAnswer?.questionOptionId?.toString()
                          );
                          
                          if (userSelectedOptionIndex != null && userSelectedOptionIndex >= 0) {
                            isUserAnswerCorrect = optionsCorrectness[userSelectedOptionIndex];
                          }
                          
                        } else if (question?.type == "text") {
                          // للأسئلة النصية - نقارن النص المكتوب مع الإجابة الصحيحة
                          var correctAnswer = question?.options
                              ?.firstWhere(
                                (option) => option.optionStatus == "correct",
                                orElse: () => GetQuizQuestionsOptionModel(),
                              )
                              .title;

                          isUserAnswerCorrect =
                              userAnswer?.answer?.toLowerCase().trim() ==
                                  correctAnswer?.toLowerCase().trim();
                        }

                        return CorrectedQuestionCotainer(
                          isMultiTrue: isUserAnswerCorrect,
                          index: index,
                          isTrue: userAnswer?.mark != "0",
                          optionsLength: question?.options?.length ?? 4,
                          qOptions: question?.options
                                  ?.map((e) => e.title ?? "")
                                  .toList() ??
                              [""],
                          qType: question?.type ?? "",
                          question: question?.title ?? "",
                          essayAnswer: userAnswer?.answer ?? "",
                          optionsCorrectness: optionsCorrectness,
                          userSelectedOptionIndex: userSelectedOptionIndex,
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