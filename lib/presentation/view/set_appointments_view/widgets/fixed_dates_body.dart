import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class FixedDatesBody extends StatelessWidget {
  const FixedDatesBody({
    super.key,
    required this.cubit, required this.grouppackagemanagementCubit,
  });

  final SetappointmentsCubit cubit;
  final GrouppackagemanagementCubit grouppackagemanagementCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.ph,
        CustomTabBar(
          tabs: [
            Text(
              "تكرار الحصص اسبوعيا",
              style: MainTextStyle.boldTextStyle(fontSize: 12),
            ),
            Text(
              "تحديد كل المواعيد",
              style: MainTextStyle.boldTextStyle(fontSize: 12),
            ),
          ],
          controller: cubit.fixedDateController!,
        ),
        SizedBox(
          height: 270.h,
          child: TabBarView(
            controller: cubit.fixedDateController,
            children: cubit.bodies(
              context: context,
              cubit: cubit,
              grouppackagemanagementCubit: grouppackagemanagementCubit,
            ),
          ),
        ),
      ],
    );
  }
}
