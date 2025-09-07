import 'dart:developer';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/student_change_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChildrenNavigator extends StatelessWidget {
  final int programId;
  final int childIndex;

  const ChildrenNavigator(
      {super.key, required this.programId, required this.childIndex});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<LectureCubit>();
    return BlocBuilder<MyProgramsCubit, MyProgramsState>(
      builder: (context, state) {
        var programCubit = context.read<MyProgramsCubit>();
        var children =
            programCubit.getAssignedChildrenToProgramEntity?.data ?? [];
        var currentChild = children[childIndex];
        // cubit.currentChildIndex = children.indexWhere(
        //   (child) => child.id == cubit.userId,
        // );

        // currentChild = children.firstWhere(
        //   (element) => element.id == cubit.userId,
        // );

        return BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return StudentsChangeItem(
              studentName:
                  "${currentChild.firstName ?? ""} ${currentChild.lastName ?? ""}",
              onBackTap: () {
                cubit.changeCurrentUserIndex(childIndex);
                log("previous child tapped");
                cubit.controller.animateTo(0);
                cubit.studentPageViewController.animateToPage(
                  childIndex - 1,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.bounceIn,
                );
                int userId = programCubit
                    .getAssignedChildrenToProgramEntity
                    ?.data?[childIndex].id ??
                    -1;
                cubit.fillUserId(userId);
                cubit.getProgramSessions(
                  programId: programId,
                  userId: userId,
                );
                // cubit.updateChildIndex(false, children.length);
                // final newChild = children[cubit.currentChildIndex];
                // cubit.fillUserId(newChild.id ?? -1);
                // cubit.showProgramDetails(programId: widget.programId);
                // cubit.getProgramSessions(
                //   programId: widget.programId,
                //   userId: newChild.id ?? -1,
                // );
              },
              onNextTap: () {
                cubit.changeCurrentUserIndex(childIndex);
                cubit.controller.animateTo(0);
                log("next child tapped");
                cubit.studentPageViewController.animateToPage(
                  childIndex + 1,
                  duration: const Duration(microseconds: 500),
                  curve: Curves.bounceIn,
                );
                // cubit.updateChildIndex(true, children.length);
                // final newChild = children[cubit.currentChildIndex];

                // cubit.showProgramDetails(programId: widget.programId);
                int userId = programCubit
                    .getAssignedChildrenToProgramEntity
                    ?.data?[childIndex].id ??
                    -1;
                cubit.fillUserId(userId);
                cubit.getProgramSessions(
                  programId: programId,
                  userId: userId,
                );
              },
            );
          },
        );
      },
    );
  }
}
