import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_plan_filter/widgets/plans_list_view_widget.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_plan_filter/widgets/start_date_field.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_plan_filter/widgets/student_counter_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class FilteringBody extends StatelessWidget {
  final ProgramSubscriptionPlanCubit cubit;

  const FilteringBody({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        if (cubit.getPlansWithDetailsLoader) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (cubit.getPlansWithDetailsEntity?.data?.isEmpty ?? true) {
          return Center(child: Text(lang.noAvailablePlans));
        }
        return SizedBox(
          height: 475.h,
          child: Column(
            children: [
              StartDateField(cubit: cubit),
              16.ph,
              PlansListViewWidget(cubit: cubit),
              24.ph,
              StudentCounterWidget(cubit: cubit),
            ],
          ),
        );
      },
    );
  }
}
