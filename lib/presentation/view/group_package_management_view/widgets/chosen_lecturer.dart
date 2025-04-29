import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_teacher_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChosenLecturer extends StatelessWidget {
  const ChosenLecturer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "مواعيد البرامج",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            4.ph,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.iconsBulb,
                  ),
                  Text(
                    "أضغط علي اسم البرنامج لإختيار الموعد المناسب لكل طالب علي حدا",
                    style: MainTextStyle.mediumTextStyle(
                      fontSize: 11,
                      color: MainColors.checkBoxBorderGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        16.ph,
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => ChosenTeacherItem(
              index: index,
              state: index != 0 ? "pending" : "done",
              onTap: () {
                Navigator.pushNamed(context, RoutePaths.setAppointmentsView);
              },
            ),
            separatorBuilder: (context, index) => 12.ph,
            itemCount: 4,
          ),
        ),
      ],
    );
  }
}




