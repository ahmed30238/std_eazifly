import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_plan_filter/widgets/filtering_body.dart';
import 'package:eazifly_student/presentation/view/layout/programs/program_plan_filter/widgets/period_tabbar_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramPlanFilter extends StatefulWidget {
  final int programId;

  const ProgramPlanFilter({super.key, required this.programId});

  @override
  State<ProgramPlanFilter> createState() => _ProgramPlanFilterState();
}

class _ProgramPlanFilterState extends State<ProgramPlanFilter>
    with TickerProviderStateMixin {
  late ProgramSubscriptionPlanCubit cubit;

  @override
  void initState() {
    cubit = context.read<ProgramSubscriptionPlanCubit>();
    cubit.getPlansWithDetails(programId: widget.programId);
    cubit.initTabBarControllers(this);
    cubit.fillProgramId(widget.programId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    var cubit = context.read<ProgramSubscriptionPlanCubit>();
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.packageDetails,
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            16.ph,
            Text(
              lang.choosePlanDescription,
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            ),
            19.ph,
            PeriodTapBarWidget(cubit: cubit),
            18.ph,
            FilteringBody(cubit: cubit),
            const Spacer(),
            CustomElevatedButton(
              text: lang.subscribe,
              color: MainColors.primary,
              radius: 16.r,
              onPressed: () {
                Navigator.pushNamed(
                  arguments: {"itemId": cubit.programId, "cubit": cubit},
                  context,
                  RoutePaths.completePaymentProcessScreen,
                );
              },
            ),
            32.ph,
          ],
        ),
      ),
    );
  }
}
