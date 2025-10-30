import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/chosen_students_loader.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/handle_tap.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/texted_checkbox_loader.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/student_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChangeLecturerReasonBody extends StatelessWidget {
  const ChangeLecturerReasonBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = ChangelecturerCubit.get(context);
    var programCubit = context.read<MyProgramsCubit>();
    var lang = context.loc!;
    return Column(
      children: [
        32.ph,
        BlocSelector<ChangelecturerCubit, ChangelecturerState, int>(
          selector: (state) => cubit.selectedStudent,
          builder: (context, selectedStudent) {
            return BlocBuilder<MyProgramsCubit, MyProgramsState>(
              bloc: programCubit,
              builder: (context, programState) {
                // Handle loading state with shimmer effect
                if (programCubit.getAssignedChildrenLoader) {
                  return const ChosenStudentLoader();
                }

                // Handle error state
                if (programState is GetAssignedChildrenErrorState) {
                  return SizedBox(
                    height: 98.h,
                    child: const Center(
                      child: Text(
                        'Error loading students',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }

                var children = programCubit.students;
                // programCubit.getAssignedChildrenToProgramEntity?.data;

                // Handle empty state
                if (children.isEmpty) {
                  return SizedBox(
                    height: 98.h,
                    child: const Center(child: Text('No students found')),
                  );
                }

                return SizedBox(
                  height: 98.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      bool isSelected = index == selectedStudent;
                      var child = children[index];
                      return StudentItem(
                        onTap: () {
                          cubit.changeSelectedStudent(index, child.id ?? -1);
                        },
                        name: "${child.firstName}",
                        image: child.image ?? "",
                        isSelected: isSelected,
                        isDoneAdded: false,
                      );
                    },
                    separatorBuilder: (context, index) => 8.pw,
                    itemCount: children.length,
                  ),
                );
              },
            );
          },
        ),
        32.ph,
        Text(
          "برجاء إختيار سبب لتغير المعلم",
          style: MainTextStyle.boldTextStyle(fontSize: 14),
        ),
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            if (cubit.selectedStudent == -1) {
              return const SizedBox.shrink();
            }
            return Text(
              "${programCubit.students[cubit.selectedStudent].firstName} للطالب",
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            );
          },
        ),
        20.ph,
        Expanded(
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              if (cubit.getChangeInstructorReasonsLoader) {
                return const TextedCheckboxLoaderList();
              }

              var reasons = cubit.getChangeInstructorReasonsEntity?.data;
              if (reasons == null || reasons.isEmpty) {
                return const Center(
                  child: Text("No cancellation reasons available"),
                );
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  var reason = reasons[index];
                  bool isSelected = cubit.changeLecturerReason[index] == true;
                  return TextedCheckBoxRow(
                    isSelcted: isSelected,
                    onChanged: (value) =>
                        cubit.chooseLecturerReasons(index, value ?? false),
                    text: reason.title ?? "",
                    value: cubit.changeLecturerReason[index],
                  );
                },
                separatorBuilder: (context, index) => 12.ph,
                itemCount: reasons.length,
              );
            },
          ),
        ),
        8.ph,
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) => CustomElevatedButton(
            text: lang.next,
            width: 343.w,
            radius: 16.r,
            color: MainColors.primary,
            onPressed: cubit.getUserSubscriptionDataLoader
                ? () {}
                : () {
                    handleTap(context: context, cubit: cubit);
                  },
            child: cubit.getUserSubscriptionDataLoader
                ? const CircularProgressIndicator.adaptive()
                : null,
          ),
        ),
        32.ph,
      ],
    );
  }
}
