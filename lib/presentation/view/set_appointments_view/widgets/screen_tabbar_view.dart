import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/fixed_dates_body.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/flexible_hour_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ScreenTabbarView extends StatelessWidget {
  final int programId;
  const ScreenTabbarView({
    super.key,
    required this.programId,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = GrouppackagemanagementCubit.get(context);

    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => SizedBox(
        height: 600.h,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: cubit.controller,
          children: [
            FixedDatesBody(
              programId: programId,
            ),
            const FlexibleHourBody()
          ],
        ),
      ),
    );
  }
}
