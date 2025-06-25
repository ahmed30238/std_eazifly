import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/student_change_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:get_storage/get_storage.dart';

class ChildrenNavigator extends StatefulWidget {
  final int programId;

  const ChildrenNavigator({super.key, required this.programId});

  @override
  State<ChildrenNavigator> createState() => _ChildrenNavigatorState();
}

class _ChildrenNavigatorState extends State<ChildrenNavigator> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LectureCubit>();
    return BlocBuilder<MyProgramsCubit, MyProgramsState>(
      builder: (context, state) {
        var programCubit = context.read<MyProgramsCubit>();
        var children =
            programCubit.getAssignedChildrenToProgramEntity?.data ?? [];
        log("$children");

        DataModel loginData = DataModel.fromJson(
          jsonDecode(
            GetStorage().read(StorageEnum.loginModel.name),
          ),
        );

        if (children.isEmpty) {
          return StudentsChangeItem(
            studentName: "${loginData.firstName} ${loginData.lastName}",
            onBackTap: () {
              log("this is index ${cubit.currentChildIndex}");
            },
            onNextTap: () {
              log("this is index ${cubit.currentChildIndex}");
            },
          );
        }

        /// التأكد من أن الفهرس الحالي في النطاق الصحيح
        if (cubit.currentChildIndex >= children.length) {
          cubit.currentChildIndex = 0;
        }

        var currentChild = children[cubit.currentChildIndex];

        return StudentsChangeItem(
          studentName: "${currentChild.firstName} ${currentChild.lastName}",
          onBackTap: () {
            log("this is index ${cubit.currentChildIndex}");
            cubit.controller.animateTo(0);

            cubit.updateChildIndex(false, children.length);
            var newChild = children[cubit.currentChildIndex];
            cubit.fillUserId(newChild.id ?? -1);
            cubit.showProgramDetails(programId: widget.programId);
          },
          onNextTap: () {
            log("this is index ${cubit.currentChildIndex}");
            cubit.controller.animateTo(0);

            cubit.updateChildIndex(true, children.length);
            var newChild = children[cubit.currentChildIndex];
            cubit.fillUserId(newChild.id ?? -1);
            cubit.showProgramDetails(programId: widget.programId);
            // cubit.getProgramSessions(
            //   programId: widget.programId,
            //   userId: newChild.id ?? -1,
            // );
          },
        );
      },
    );
  }
}
