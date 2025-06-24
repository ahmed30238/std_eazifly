import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/corrcected_assignment_details_view/widgets/question_an_sol_container.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CorrcectedAssignmentDetailsView extends StatefulWidget {
  final int assignmentId;
  final String assignmentTitle;
  const CorrcectedAssignmentDetailsView({
    super.key,
    required this.assignmentId,
    required this.assignmentTitle,
  });

  @override
  State<CorrcectedAssignmentDetailsView> createState() =>
      _CorrcectedAssignmentDetailsViewState();
}

class _CorrcectedAssignmentDetailsViewState
    extends State<CorrcectedAssignmentDetailsView> {
  late LectureCubit cubit;
  @override
  void initState() {
    cubit = context.read<LectureCubit>();
    super.initState();
    cubit.getAssignmentDetails(
      assignmentId: widget.assignmentId,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: widget.assignmentTitle,
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          16.ph,
          BlocBuilder<LectureCubit, LectureState>(
            builder: (context, state) {
              final cubit = LectureCubit.get(context);
              final assignment = cubit.getAssignmentDetailsEntity?.data;

              // حالة التحميل
              if (cubit.getAssignmentDetailsLoader) {
                return const Center(child: CircularProgressIndicator());
              }

              // حالة الخطأ
              if (state is GetAssignmentDetailsErrorState) {
                return Center(
                  child: Text(
                    'حدث خطأ في تحميل البيانات',
                    style: MainTextStyle.regularTextStyle(
                        color: Colors.red, fontSize: 12),
                  ),
                );
              }

              // حالة عدم وجود بيانات
              if (assignment == null) {
                return Center(
                  child: Text(
                    'لا توجد بيانات متاحة',
                    style: MainTextStyle.regularTextStyle(fontSize: 12),
                  ),
                );
              }

              // حساب النتيجة
              final mark = int.tryParse(assignment.mark ?? "0") ?? 0;
              final isCorrected = assignment.status == "corrected";
              final isPassed = isCorrected && mark >= 5;
              final statusText = isCorrected
                  ? (isPassed ? "ناجح" : "راسب")
                  : "لم يتم التصحيح بعد";
              final statusColor = isCorrected
                  ? (isPassed ? MainColors.greenTeal : MainColors.red)
                  : MainColors.grayTextColors;
              final bgColor = isCorrected
                  ? (isPassed ? MainColors.lightgreenTeal : MainColors.lightRed)
                  : MainColors.lightGray;

              return StudentStats(
                horizontalPadding: 0,
                titleText: const [
                  "تاريخ التسليم",
                  "درجة الإمتحان",
                  "حالة الإمتحان"
                ],
                downSideWidgets: [
                  // تاريخ التسليم
                  Text(
                    assignment.createdAt?.toString().substring(0, 10) ?? "-",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.blackText,
                    ),
                  ),

                  // درجة الاختبار
                  Text(
                    '${assignment.mark ?? "0"} / 10',
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.blackText,
                    ),
                  ),

                  // حالة الاختبار
                  Container(
                    width: 120.w,
                    height: 26.h,
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(55.r),
                    ),
                    child: Center(
                      child: Text(
                        statusText,
                        style: MainTextStyle.mediumTextStyle(
                          fontSize: 12,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          16.ph,
          BlocBuilder<LectureCubit, LectureState>(
            builder: (context, state) {
              var assignment = cubit.getAssignmentDetailsEntity?.data;

              return QuestionAndSolutionContainer(
                isCorrected: assignment?.status == "corrected", // أو false إذا لم يتم التصحيح
                title: assignment?.title ?? "",
                answerText: assignment?.text ?? "",
                teacherFeedback: "إجابة صحيحة، جيد جداً",
                studentAttachments: [
                  // assignment?.userVoiceNote ?? "",
                  assignment?.file ?? ""
                ],
                // teacherAttachments: [
                //   "https://example.com/teacher_feedback.pdf"
                // ],
                studentVoiceNote: assignment?.userVoiceNote,
                teacherVoiceNote: assignment?.instructorVoiceNote,
                studentVoiceDuration: 30.0,
                teacherVoiceDuration: 45.0,
                mark: "${assignment?.mark}",
                fullMark: "10",
              );
            },
          ),
        ],
      ),
    );
  }
}
