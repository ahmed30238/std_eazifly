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
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.ph,
                BlocBuilder<LecturequizCubit, LecturequizState>(
                  builder: (context, state) {
                    var quizData = cubit.getQuizQuestionsEntity?.data;
                    return StudentStats(
                      horizontalPadding: 0,
                      titleText: const [
                        "تاريخ التسليم",
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
                          " 100 / ....",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: MainColors.blackText,
                          ),
                        ),
                        TextedContainer(
                          //TODO
                          width: 105.w,
                          height: 26.h,
                          text: "جاري التسليم",
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
                    "الاسالة",
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
                          return QuestionContainer(
                            
                            qOptions: question?.options
                                    ?.map(
                                      (e) => e.title ?? "",
                                    )
                                    .toList() ??
                                [""],
                            qType: quizData?.questions?[index].type ?? "",
                            question: question?.title ?? "",
                            index: index,
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
          8.ph,
          CustomElevatedButton(
            width: 344.w,
            text: "تسليم الإجابات",
            onPressed: () {
              cubit.submitQuiz(quizId: widget.quizId);
            },
            radius: 16.r,
            color: MainColors.blueTextColor,
          ),
          32.ph,
        ],
      ),
    );
  }
}
