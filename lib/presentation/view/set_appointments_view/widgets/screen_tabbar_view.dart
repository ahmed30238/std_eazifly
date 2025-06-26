import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/fixed_dates_body.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/flexible_hour_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ScreenTabbarView extends StatelessWidget {
    final GrouppackagemanagementCubit grouppackagemanagementCubit;

  const ScreenTabbarView({
    super.key,required this.grouppackagemanagementCubit,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SetappointmentsCubit.get(context);

    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => SizedBox(
        height: 345.h,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: cubit.controller,
          children: [
            FixedDatesBody(
              cubit: cubit,
              grouppackagemanagementCubit: grouppackagemanagementCubit,
            ),
            const FlexibleHourBody()
          ],
        ),
      ),
    );
  }
}
