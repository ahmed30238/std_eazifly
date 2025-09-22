import 'dart:developer';

import '../../../data/models/sessions/get_instructor_availabilities_model.dart';
import '../../controller/cancel_session_controller/cancelsession_cubit.dart';
import '../../controller/lecture/lecture_cubit.dart';
import '../subscription_details_view/widgets/imports.dart';

bool canConfirmSelection(CancelSessionCubit cubit) {
  return cubit.dayController.text.isNotEmpty &&
      cubit.timeController.text.isNotEmpty &&
      !cubit.changeSessionDateLoader;
}

Future<void> confirmSelection(
  BuildContext context, {
  required CancelSessionCubit cubit,
  required LectureCubit lectureCubit,
  required int sessionId,
  required bool navigateToMyPrograms,
}) async {
  if (!canConfirmSelection(cubit)) return;

  log("=== Final Selection Details ===");
  log("Selected Day Name: ${cubit.dayController.text}");
  log("Selected Time: ${cubit.timeController.text}");
  log("Full Date: ${cubit.selectedTimeSlotData?.fullDate}");
  log("===============================");

  try {
    // التحقق من وجود? fullDate
    if (cubit.selectedTimeSlotData?.fullDate == null ||
        cubit.selectedTimeSlotData?.fullDate.toString().isEmpty == true)  {
      throw Exception("التاريخ غير متاح للوقت المحدد");
    }

    // التحقق من اكتمال البيانات
    if (cubit.isScheduleDataComplete()) {
      // استدعاء تغيير موعد الجلسة
      await cubit.changeSessionDate(sessionId: sessionId);

      if (!context.mounted) return;

      if (navigateToMyPrograms) {
        Navigator.pushReplacementNamed(context, RoutePaths.layoutPath);
      } else {
        // حفظ المعلومات المطلوبة قبل استخدام context
        final userId = lectureCubit.userId;
        final programId = lectureCubit.currentProgramId;

        back(context);

        // استدعاء getProgramSessions
        lectureCubit.getProgramSessions(programId: programId, userId: userId);
      }
    } else {
      throw Exception("البيانات غير مكتملة");
    }
  } catch (e) {
    log("Error saving selection: $e");

    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("حدث خطأ في حفظ البيانات: ${e.toString()}"),
        backgroundColor: Colors.red,
      ),
    );
  }
}

List<MapEntry<String, List<GetInstructorAvailabilitieDayModel>?>> dayList(
  BuildContext context,
) {
  final availabilityData = context
      .read<CancelSessionCubit>()
      .getInstructorAvailabilitiesEntity
      ?.data;
  final daysMap = {
    "Saturday": availabilityData?.saturday,
    "Sunday": availabilityData?.sunday,
    "Monday": availabilityData?.monday,
    "Tuesday": availabilityData?.tuesday,
    "Wednesday": availabilityData?.wednesday,
    "Thursday": availabilityData?.thursday,
    "Friday": availabilityData?.friday,
  };

  // تصفية الأيام التي تحتوي على بيانات فقط
  final filteredDaysMap = Map.fromEntries(
    daysMap.entries.where(
          (entry) => entry.value != null && entry.value!.isNotEmpty,
    ),
  );
  final daysList = filteredDaysMap.entries.toList();
  return daysList;
}

String weekdayToName(int weekday) {
  switch (weekday) {
    case DateTime.saturday:
      return "Saturday";
    case DateTime.sunday:
      return "Sunday";
    case DateTime.monday:
      return "Monday";
    case DateTime.tuesday:
      return "Tuesday";
    case DateTime.wednesday:
      return "Wednesday";
    case DateTime.thursday:
      return "Thursday";
    case DateTime.friday:
      return "Friday";
    default:
      return "";
  }
}
