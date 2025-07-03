import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_cubit.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/handle_tap.dart';
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
                  return SizedBox(
                    height: 98.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 80.w,
                          height: 98.h,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => 8.pw,
                      itemCount: 3, // Show 3 loading placeholders
                    ),
                  );
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

                var children =
                    programCubit.getAssignedChildrenToProgramEntity?.data;

                // Handle empty state
                if (children == null || children.isEmpty) {
                  return SizedBox(
                    height: 98.h,
                    child: const Center(
                      child: Text('No students found'),
                    ),
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
          style: MainTextStyle.boldTextStyle(
            fontSize: 14,
          ),
        ),
        if (cubit.selectedStudent != -1)
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => Text(
              "${programCubit.getAssignedChildrenToProgramEntity?.data?[cubit.selectedStudent].firstName} للطالب",
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
              ),
            ),
          ),
        20.ph,
        Expanded(
          child: BlocBuilder(
            bloc: cubit,
            builder: (context, state) => ListView.separated(
              itemBuilder: (context, index) {
                for (var i = 0; i < 4; i++) {
                  cubit.changeLecturerReason.add(false);
                }
                bool isSelcted = cubit.changeLecturerReason[index] == true;
                return TextedCheckBoxRow(
                  isSelcted: isSelcted,
                  onChanged: (value) =>
                      cubit.chooseLecturerReasons(index, value ?? false),
                  text: "سبب ${index + 1}",
                  value: cubit.changeLecturerReason[index],
                );
              },
              separatorBuilder: (context, index) => 12.ph,
              itemCount: 4,
            ),
          ),
        ),
        8.ph,
        BlocBuilder(
          bloc: cubit,
          builder: (context, state) => CustomElevatedButton(
            text: lang.next,
            width: 343.w,
            radius: 16.r,
            color: MainColors.blueTextColor,
            onPressed: cubit.getUserSubscriptionDataLoader
                ? () {}
                : () {
                    handleTap(
                      context: context,
                      cubit: cubit,
                    );
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
