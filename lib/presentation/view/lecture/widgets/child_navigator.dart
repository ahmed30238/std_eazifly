import 'dart:developer';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/student_change_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChildrenNavigator extends StatelessWidget {
  final int programId;
  final int childIndex;

  const ChildrenNavigator({
    super.key,
    required this.programId,
    required this.childIndex,
  });

  void _navigateToChild(BuildContext context, LectureCubit cubit, MyProgramsCubit programCubit,
      List<dynamic> children, int targetIndex, String direction) {
    // التحقق من صحة الـ target index
    if (targetIndex < 0 || targetIndex >= children.length) {
      log("Cannot navigate $direction: target index $targetIndex is out of bounds (0-${children.length - 1})");
      return;
    }

    int userId = children[targetIndex].id ?? -1;

    // التحقق من صحة الـ userId
    if (userId == -1) {
      log("Invalid userId for child at index $targetIndex");
      return;
    }

    log("$direction child tapped - moving from index $childIndex to $targetIndex");

    // تحديث الحالة
    cubit.changeCurrentUserIndex(targetIndex);
    cubit.fillUserId(userId);

    // تحريك الـ controller
    cubit.controller.animateTo(0);
    cubit.studentPageViewController.animateToPage(
      targetIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    // استدعاء الـ API للطفل الجديد
    cubit.getProgramSessions(
      programId: programId,
      userId: userId,
    );
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<LectureCubit>();
    return BlocBuilder<MyProgramsCubit, MyProgramsState>(
      builder: (context, state) {
        var programCubit = context.read<MyProgramsCubit>();
        var children = programCubit.getAssignedChildrenToProgramEntity?.data ?? [];

        // التحقق من صحة الـ index
        if (children.isEmpty || childIndex < 0 || childIndex >= children.length) {
          return const SizedBox.shrink();
        }

        var currentChild = children[childIndex];

        // تحديد إمكانية الانتقال للسابق والتالي
        bool canGoBack = childIndex > 0;
        bool canGoNext = childIndex < children.length - 1;

        return BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            return StudentsChangeItem(
              studentName: "${currentChild.firstName ?? ""} ${currentChild.lastName ?? ""}",
              onBackTap: () {
                if (canGoBack) {
                  _navigateToChild(context, cubit, programCubit, children, childIndex - 1, "Previous");
                } else {
                  log("Cannot go back: already at first child (index $childIndex)");
                }
              },
              onNextTap: () {
                if (canGoNext) {
                  _navigateToChild(context, cubit, programCubit, children, childIndex + 1, "Next");
                } else {
                  log("Cannot go next: already at last child (index $childIndex)");
                }
              },
            );
          },
        );
      },
    );
  }
}