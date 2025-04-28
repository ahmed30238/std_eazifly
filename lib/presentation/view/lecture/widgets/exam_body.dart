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
      itemBuilder: (context, index) => CustomListTile(
        iconContainerColor: MainColors.white,
        title: "title",
        subTitle: "subTitle",
        trailing: ExamBodyCustomTrailing(
          status: StudentStatus.acceptable,
          // status: cubit?.getUserQuizzesEntities?.data?[index]?.status??"",
          isNewStudent: index == 0 ? true : false,
        ),
        icon: MyImages.iconsProfile,
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
