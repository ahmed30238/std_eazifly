import 'package:eazifly_student/core/enums/student_success_status.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/custom_list_tile.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/exam_body_training.dart';

import '../../subscription_details_view/widgets/imports.dart';

class ExamBodyWidget extends StatelessWidget {
  const ExamBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = StudentsCubit.get(context);

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
        onTap: () =>
            Navigator.pushNamed(context, RoutePaths.lectureQuizzDetailsView),
        child: CustomListTile(
          iconHeight: 24.h,
          iconWidth: 24.w,
          iconContainerColor: MainColors.white,
          title: "إسم الإمتحان 1",
          subTitle: "12-2-2025   8:10 PM ",
          trailing: ExamBodyCustomTrailing(
            status: index == 0
                ? StudentStatus.newStudent
                : StudentStatus.acceptable,
            isNewStudent: index == 0 ? true : false,
          ),
          icon: Assets.iconsLectQuizzesIcon,
        ),
      ),
      separatorBuilder: (context, index) => Column(
        children: [
          const CustomHorizontalDivider(
            thickness: 1,
          ),
          10.ph,
        ],
      ),
      itemCount: 4,
    );
  }
}
