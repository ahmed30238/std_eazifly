import 'package:eazifly_student/domain/entities/my_programs/get_my_programs_entity.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/children_modal_sheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

onMyProgramTap({
  required BuildContext context,
  required MyProgramsCubit cubit,
  required MyProgramEntity item,
  // required DataModel loginData,
  required int noOfChildren,
  required int programId,
}) {
  String? sessionStatus = item.currentSession?.status;

  if (sessionStatus != null) {
    if (sessionStatus == "started") {
      _navigateToLectureDetails(context, item);
    } else {
      _handleNotStartedLecture(
        context: context,
        // isParent: isParent,
        noOfChildren: noOfChildren,
        cubit: cubit,
        programId: programId,
      );
    }
  } else {
    _handleNoCurrentSession(
      context: context,
      noOfChildren: noOfChildren,
      cubit: cubit,
      programId: programId,
    );
  }
}

void _handleNotStartedLecture({
  required BuildContext context,
  required int noOfChildren,
  required MyProgramsCubit cubit,
  required int programId,
}) {
  if (noOfChildren > 0) {
    _showChildrenBottomSheet(context, noOfChildren, programId, cubit);
  } else {
    delightfulToast(
      message: "لم تقم بالاشتراك لاي من الطلاب في هذا البرنامج",
      context: context,
    );
    // _navigateToProgramDetails(context, programId: programId);
  }
}

// دالة للتعامل مع عدم وجود جلسة حالية
void _handleNoCurrentSession({
  required BuildContext context,
  required int noOfChildren,
  required MyProgramsCubit cubit,
  required int programId,
}) {
  if (noOfChildren > 0) {
    _showChildrenBottomSheet(context, noOfChildren, programId, cubit);
  } else {
    delightfulToast(
      message: "لم تقم بالاشتراك لاي من الطلاب في هذا البرنامج",
      context: context,
    );

    // _navigateToProgramDetails(context, programId: programId);
  }
}

void _showChildrenBottomSheet(
  BuildContext context,
  int noOfChildren,
  int programId,
  MyProgramsCubit cubit,
) {
  showModalSheet(
    isFixedSize: true,
    maxHeight: 500.h,
    minHeight: 500.h,
    context,
    widget: ChildrenModalSheet(
      noOfChildren: noOfChildren,
      programId: programId,
      cubit: cubit,
    ),
  );
}

// دالة للانتقال لتفاصيل البرنامج
// void _navigateToProgramDetails(BuildContext context, {required int programId}) {
//   Navigator.pushNamed(
//     context,
//     RoutePaths.lectureView,
//     arguments: {"programId": programId},
//   );
// }

void _navigateToLectureDetails(BuildContext context, MyProgramEntity item) {
  Navigator.pushNamed(
    context,
    RoutePaths.navigateToLectureView,
    arguments: {"sessionId": item.currentSession?.id ?? -1},
  );
}
