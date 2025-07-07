import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChangeLecturerView extends StatefulWidget {
  final int programId;
  const ChangeLecturerView({super.key, required this.programId});

  @override
  State<ChangeLecturerView> createState() => _ChangeLecturerViewState();
}

class _ChangeLecturerViewState extends State<ChangeLecturerView>
    with TickerProviderStateMixin {
  late ChangelecturerCubit cubit;
  @override
  void initState() {
    cubit = context.read<ChangelecturerCubit>();
    context
        .read<MyProgramsCubit>()
        .getAssignedChildrenToProgram(programId: widget.programId);
    cubit.initTabBarController(this);
    cubit.getChangeInstructorReasons();
    cubit.initFixedDateTabBarController(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;

    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تغيير محاضر تابع لبرنامج",
        leadingText: lang.back,
        isCenterTitle: true,
        onLeadinTap: () => cubit.decrementBodyIndex(context),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            8.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) => CustomLinearPercentIndicator(
                percent: cubit.linearIndicatorPercent,
              ),
            ),
            Expanded(
              child: BlocBuilder(
                bloc: cubit,
                builder: (context, state) => cubit.bodies[cubit.bodyIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
