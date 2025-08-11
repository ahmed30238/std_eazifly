import 'dart:developer';

import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/custom_list_tile.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/exam_body_trailing.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/report_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class HomeQuizzes extends StatefulWidget {
  const HomeQuizzes({super.key});

  @override
  State<HomeQuizzes> createState() => _HomeQuizzesState();
}

class _HomeQuizzesState extends State<HomeQuizzes> {
  late HomeCubit cubit;
  @override
  void initState() {
    cubit = context.read<HomeCubit>();
    super.initState();
    cubit.getHomeQuizzes();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.quizzes,
        leadingText: lang.home,
        isCenterTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "كل الاختبارات",
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
              ),
            ),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (cubit.getHomeQuizzesLoader) {
                // Show loading indicator while data is being fetched
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              // Check if data is loaded or if there's an error
              var quizzes = cubit.getHomeQuizzesEntity?.data;

              if (quizzes == null || quizzes.isEmpty) {
                // Show empty state or error message
                return Expanded(
                  child: Center(
                    child: Text(
                      'No quizzes available',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                );
              }

              return Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var quiz = quizzes[index];
                    bool notUploaded = quiz.status == "pending";
                    return CustomListTile(
                      onTap: () {
                        var lectureCubit = context.read<LectureCubit>();
                        log("${lectureCubit.currentProgramId}");
                        Navigator.pushNamed(
                          context,
                          notUploaded
                              ? RoutePaths.lectureQuizzDetailsView
                              : RoutePaths.correctedQuizDetailsView,
                          arguments: {
                            "programId": lectureCubit.currentProgramId,
                            "userId": lectureCubit.userId,
                            "quizId": quiz.id,
                            "quizTitle": quiz.title
                          },
                        );
                      },
                      iconHeight: 24.h,
                      iconWidth: 24.w,
                      iconContainerColor: MainColors.background,
                      title: quiz.title ?? "null title",
                      subTitle: formatDateWithAmPm(quiz.createdAt.toString()),
                      trailing: ExamBodyCustomTrailing(
                        quizGrade: quiz.fullMark ?? "",
                        stdGrade: quiz.totalMark ?? "",
                        status: LectureCubit.calculateStudentStatus(
                          totalMark: quiz.totalMark,
                          fullMark: quiz.fullMark,
                          quizStatus: quiz.status,
                        ),
                        isNewExam: quiz.status == "pending",
                      ),
                      icon: Assets.iconsLectQuizzesIcon,
                    );
                  },
                  separatorBuilder: (context, index) => Column(
                    children: [
                      const CustomHorizontalDivider(
                        thickness: 1,
                      ),
                      10.ph,
                    ],
                  ),
                  itemCount: quizzes.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
