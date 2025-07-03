import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/add_new_student_data_view/widgets/choose_teacher_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChooseProperLecturerBody extends StatelessWidget {
  const ChooseProperLecturerBody({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = ChangelecturerCubit.get(context);
    return Column(
      children: [
        44.ph,
        SizedBox(
          height: 36.h,
          child: Text(
            "برجاء تحديد المحاضر المناسب",
            style: MainTextStyle.boldTextStyle(
              fontSize: 14,
            ),
          ),
        ),
        28.ph,
        SizedBox(
          height: 157.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const SuggestedTeachersItem(
              blured: false,
            ),
            separatorBuilder: (context, index) => 16.pw,
            itemCount: 5,
          ),
        ),
        const Spacer(),
        32.ph,
        CustomElevatedButton(
          radius: 16.r,
          width: 343.w,
          height: 48.w,
          color: MainColors.blueTextColor,
          text: "التالي",
          onPressed: () {
            Navigator.pushNamed(
              context,
              RoutePaths.lectureView,
              arguments: {
                "programId": context.read<LectureCubit>().currentProgramId,
              },
            );
          },
        ),
        32.ph,
      ],
    );
  }
}
