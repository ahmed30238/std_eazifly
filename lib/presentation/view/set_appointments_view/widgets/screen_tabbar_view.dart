import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/fixed_dates_body.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/flexible_hour_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ScreenTabbarView extends StatelessWidget {
  const ScreenTabbarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = GrouppackagemanagementCubit.get(context);

    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => SizedBox(
        height: 345.h,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: cubit.controller,
          children: [const FixedDatesBody(), const FlexibleHourBody()],
        ),
      ),
    );
  }
}
