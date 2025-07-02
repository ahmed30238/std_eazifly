import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class CancelSessionView extends StatefulWidget {
  // final int programId;
  const CancelSessionView({
    super.key,
  });

  @override
  State<CancelSessionView> createState() => _CancelSessionViewState();
}

class _CancelSessionViewState extends State<CancelSessionView> {
  late CancelSessionCubit cubit;
  @override
  void initState() {
    cubit = context.read<CancelSessionCubit>();
    super.initState();
    cubit.getCancelReasons();
    cubit.getInstructorAvailabilities(
      instructorId: (int.tryParse(
            context
                    .read<LectureCubit>()
                    .showProgramDetailsEntity
                    ?.data
                    ?.nextSession
                    ?.instructorId ??
                "",
          )) ??
          -1,
      duration: (int.tryParse(
            context
                    .read<LectureCubit>()
                    .showProgramDetailsEntity
                    ?.data
                    ?.nextSession
                    ?.duration ??
                "",
          )) ??
          -1,
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.cancelSession,
        leadingText: lang.back,
        onLeadinTap: () => cubit.decrementBodyIndex(context),
        isCenterTitle: true,
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
                builder: (context, state) {
                  return cubit.bodies[cubit.bodyIndex];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
