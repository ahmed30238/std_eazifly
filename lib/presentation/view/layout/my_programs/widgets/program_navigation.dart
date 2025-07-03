import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_my_programs_entity.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/children_modal_sheet.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

onMyProgramTap({
  required BuildContext context,
  required MyProgramsCubit cubit,
  required MyProgramEntity item,
  required DataModel loginData,
  required int noOfChildren,
  required int programId,
}) {
  // تحديد نوع المستخدم
  bool isParent = loginData.parentId == null;

  // حالة المحاضرة
  String? sessionStatus = item.currentSession?.status;

  // إذا كان هناك جلسة حالية
  if (sessionStatus != null) {
    if (sessionStatus == "started") {
      // المحاضرة بدأت - انتقال لتفاصيل المحاضرة
      _navigateToLectureDetails(context, cubit, item);
    } else {
      // المحاضرة لم تبدأ
      _handleNotStartedLecture(
        context: context,
        isParent: isParent,
        noOfChildren: noOfChildren,
        cubit: cubit,
        programId: programId,
      );
    }
  } else {
    // لا توجد جلسة حالية
    _handleNoCurrentSession(
      context: context,
      isParent: isParent,
      noOfChildren: noOfChildren,
      cubit: cubit,
      programId: programId,
    );
  }
}

// دالة للانتقال لتفاصيل المحاضرة الجارية
void _navigateToLectureDetails(
  BuildContext context,
  MyProgramsCubit cubit,
  MyProgramEntity item,
) {
  Navigator.pushNamed(
    context,
    RoutePaths.navigateToLectureView,
    arguments: {
      "cubit": cubit,
      "sessionId": item.currentSession?.id ?? -1,
    },
  );
}

// دالة للتعامل مع المحاضرة التي لم تبدأ
void _handleNotStartedLecture({
  required BuildContext context,
  required bool isParent,
  required int noOfChildren,
  required MyProgramsCubit cubit,
  required int programId,
}) {
  if (isParent && noOfChildren > 0) {
    // إذا كان المستخدم أب - عرض bottom sheet للأطفال
    _showChildrenBottomSheet(
      context,
      noOfChildren,
      cubit,
      programId,
    );
  } else {
    // إذا لم يكن أب - انتقال لتفاصيل البرنامج
    _navigateToProgramDetails(context, programId: programId);
  }
}

// دالة للتعامل مع عدم وجود جلسة حالية
void _handleNoCurrentSession({
  required BuildContext context,
  required bool isParent,
  required int noOfChildren,
  required MyProgramsCubit cubit,
  required int programId,
}) {
  if (isParent && noOfChildren > 0) {
    // إذا كان المستخدم أب - عرض bottom sheet للأطفال فقط
    // if () {
    _showChildrenBottomSheet(
      context,
      noOfChildren,
      cubit,
      programId,
    );
    // }
  } else {
    // إذا لم يكن أب - انتقال لتفاصيل البرنامج
    _navigateToProgramDetails(context, programId: programId);
  }
}

// دالة لعرض bottom sheet للأطفال
void _showChildrenBottomSheet(
  BuildContext context,
  int noOfChildren,
  MyProgramsCubit cubit,
  int programId,
) {
  showModalSheet(
    isFixedSize: true,
    maxHeight: 500.h,
    minHeight: 500.h,
    context,
    widget: ChildrenModalSheet(
      cubit: cubit,
      noOfChildren: noOfChildren,
      programId: programId,
    ),
  );
}

// دالة للانتقال لتفاصيل البرنامج
void _navigateToProgramDetails(BuildContext context, {required int programId}) {
  Navigator.pushNamed(
    context,
    RoutePaths.lectureView,
    arguments: {
      "programId": programId,
    },
  );
}
