import 'package:eazifly_student/presentation/controller/cancel_session_controller/cancelsession_cubit.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/change_time_bottomsheet_compnents/change_time_bottomsheet_loader.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import '../helper_functions.dart';
import 'change_time_bottomsheet_compnents/specify_day_widget.dart';
import 'change_time_bottomsheet_compnents/specify_timeslot_widget.dart';

class ChangeTimeBottomSheetDesign extends StatefulWidget {
  final BuildContext mainContext;

  final int sessionId;

  const ChangeTimeBottomSheetDesign({
    super.key,
    required this.sessionId,
    required this.mainContext,
  });

  @override
  State<ChangeTimeBottomSheetDesign> createState() =>
      _ChangeTimeBottomSheetDesignState();
}

class _ChangeTimeBottomSheetDesignState
    extends State<ChangeTimeBottomSheetDesign> {
  late CancelSessionCubit cubit;
  late LectureCubit lectureCubit;

  @override
  void initState() {
    cubit = context.read<CancelSessionCubit>();
    lectureCubit = context.read<LectureCubit>();
    final nextSession = context
        .read<MyProgramsCubit>()
        .getAssignedChildrenToProgramEntity
        ?.data?[lectureCubit.currentUserIndex]
        .nextSession;
    cubit.getInstructorAvailabilities(
      instructorId: (int.tryParse(nextSession?.instructorId ?? "")) ?? -1,
      duration: (int.tryParse(nextSession?.duration ?? "")) ?? -1,
      context: context,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CancelSessionCubit, CancelSessionState>(
      builder: (context, state) {
        final availabilityData = cubit.getInstructorAvailabilitiesEntity?.data;
        if (cubit.getInstructorAvailabilitiesLoader ||
            availabilityData == null) {
          return const ChangeTimeBottomSheetShimmerLoader();
        }
        return CustomBottomSheetDesign(
          widget: Column(
            children: [
              16.ph,
              Text(
                "برجاء تحديد الموعد الجديد",
                style: MainTextStyle.boldTextStyle(fontSize: 14),
              ),
              32.ph,
              // Day Dropdown
              SpecifyDayWidget(cubit: cubit, lectureCubit: lectureCubit),

              20.ph,
              // Time Dropdown
              SpecifyTimeslotWidget(
                cubit: cubit,
                lectureCubit: lectureCubit,
                mainContext: widget.mainContext,
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomElevatedButton(
                  radius: 16.r,
                  text: "تحديد موعد جديد",
                  color: MainColors.primary,
                  onPressed: () {
                    confirmSelection(
                      context,
                      cubit: cubit,
                      lectureCubit: lectureCubit,
                      sessionId: widget.sessionId,
                      navigateToMyPrograms: false,
                    );
                  },
                  child: cubit.changeSessionDateLoader
                      ? const CircularProgressIndicator.adaptive()
                      : null,
                ),
              ),
              16.ph,
            ],
          ),
        );
      },
    );
  }
}
