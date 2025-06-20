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
              var assignment = cubit.getAssignmentDetailsEntity?.data;
              return StudentStats(
                horizontalPadding: 0,
                titleText: const [
                  "تاريخ التسليم",
                  "درجة الإمتحان",
                  "حالة الإمتحان"
                ],
                downSideWidgets: [
                  Text(
                    formatDate(assignment?.createdAt ?? DateTime.now())
                        .substring(0, 10),
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.blackText,
                    ),
                  ),
                  Text(
                    "${assignment?.mark} / 100",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.blackText,
                    ),
                  ),
                  TextedContainer(
                    // TODO ناجح او راسب
                    width: 63.w,
                    height: 26.h,
                    text: assignment?.status ?? "",
                    textColor: MainColors.greenTeal,
                    containerColor: MainColors.lightgreenTeal,
                    radius: 55.r,
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
                fullTeacherAssessment: true,
                text: assignment?.text ?? "",
                title: assignment?.title ?? "",
                stdImages: "",
                stdImagesLength: 2,
                teacherAssessment: "تقييم المعلم",
                instructorImgs: "",
                instructorImgsLength: 2,
                // index: 0,
              );
            },
          ),
          // Expanded(
          //   child: ListView.separated(
          //     physics: const BouncingScrollPhysics(),
          //     padding: EdgeInsets.only(
          //       bottom: 16.h,
          //     ),
          //     itemBuilder: (context, index) => QuestionAndSolutionContainer(
          //       fullTeacherAssessment: index == 1,
          //       index: index,
          //     ),
          //     separatorBuilder: (context, index) => 16.ph,
          //     itemCount: 2,
          //   ),
          // ),
        ],
      ),
    );
  }
}
