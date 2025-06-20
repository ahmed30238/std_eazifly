import 'package:eazifly_student/core/enums/student_success_status.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/custom_list_tile.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/exam_body_trailing.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/report_body.dart';

import '../../subscription_details_view/widgets/imports.dart';

class ExamBodyWidget extends StatelessWidget {
  const ExamBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LectureCubit>();
    var quizzes = cubit.getUserQuizzesEntity?.data;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var quiz = quizzes?[index];
        return CustomListTile(
          onTap: () => Navigator.pushNamed(
              context, RoutePaths.lectureQuizzDetailsView,
              arguments: {
                "programId": int.tryParse(quiz?.programId ?? ""),
                "userId": 3, //TODO
                "quizId": quiz?.id,
                "quizTitle": quiz?.title
              }),
          iconHeight: 24.h,
          iconWidth: 24.w,
          iconContainerColor: MainColors.white,
          title: quiz?.title ?? "null title",
          subTitle: formatDateWithAmPm(quiz?.createdAt.toString()),
          trailing: ExamBodyCustomTrailing(
            quizGrade: "10",
            stdGrade: "5",
            status: index == 0
                ? StudentStatus.newStudent
                : StudentStatus.acceptable,
            isNewExam: quiz?.status != "pending",
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
      itemCount: quizzes?.length ?? 0,
    );
  }
}
