import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/student_change_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChildrenNavigator extends StatefulWidget {
  final int programId;

  const ChildrenNavigator({super.key, required this.programId});

  @override
  State<ChildrenNavigator> createState() => _ChildrenNavigatorState();
}

class _ChildrenNavigatorState extends State<ChildrenNavigator> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<LectureCubit>();
    return BlocBuilder<MyProgramsCubit, MyProgramsState>(
      builder: (context, state) {
        var programCubit = context.read<MyProgramsCubit>();
        var children =
            programCubit.getAssignedChildrenToProgramEntity?.data ?? [];

        final isParent = cubit.currentChildIndex == -1;
        var currentChild = isParent ? null : children[cubit.currentChildIndex];
        if (loginData?.id !=
            cubit.userId /* يعني المستخدم الحالي مش هو الاب */) {
          cubit.currentChildIndex = children.indexWhere(
            (child) => child.id == cubit.userId,
          );

          currentChild = children.firstWhere(
            (element) => element.id == cubit.userId,
          );
        }

        return BlocBuilder(
          bloc: cubit,
          builder: (context, state) => StudentsChangeItem(
            studentName: isParent
                ? "${loginData?.firstName} ${loginData?.lastName}"
                : "${currentChild?.firstName ?? ""} ${currentChild?.lastName ?? ""}",
            onBackTap: () {
              cubit.controller.animateTo(0);
              cubit.updateChildIndex(false, children.length);

              if (cubit.currentChildIndex == -1) {
                // عرض الأب
                cubit.fillUserId(loginData?.id ?? -1);
                cubit.showProgramDetails(programId: widget.programId);
                cubit.getProgramSessions(
                  programId: widget.programId,
                  userId: loginData?.id ?? -1,
                );
              } else {
                final newChild = children[cubit.currentChildIndex];
                cubit.fillUserId(newChild.id ?? -1);
                cubit.showProgramDetails(programId: widget.programId);
                cubit.getProgramSessions(
                  programId: widget.programId,
                  userId: newChild.id ?? -1,
                );
              }
            },
            onNextTap: () {
              cubit.controller.animateTo(0);
              cubit.updateChildIndex(true, children.length);

              if (cubit.currentChildIndex == -1) {
                // عرض الأب
                cubit.fillUserId(loginData?.id ?? -1);
                cubit.showProgramDetails(programId: widget.programId);
                cubit.getProgramSessions(
                  programId: widget.programId,
                  userId: loginData?.id ?? -1,
                );
              } else {
                final newChild = children[cubit.currentChildIndex];
                cubit.fillUserId(newChild.id ?? -1);
                cubit.showProgramDetails(programId: widget.programId);
                cubit.getProgramSessions(
                  programId: widget.programId,
                  userId: newChild.id ?? -1,
                );
              }
            },
          ),
        );
      },
    );
  }
}
