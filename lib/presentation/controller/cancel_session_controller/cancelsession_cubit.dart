import 'dart:developer';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/data/models/sessions/cancel_session_tojson.dart';
import 'package:eazifly_student/data/models/sessions/change_session_date_tojson.dart';
import 'package:eazifly_student/domain/entities/sessions/cancel_session_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/change_session_date_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/get_cancel_session_reason_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/get_instructor_availabilities_entity.dart';
import 'package:eazifly_student/domain/use_cases/cancel_session_usecase.dart';
import 'package:eazifly_student/domain/use_cases/change_session_date_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_cancel_session_reasons_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_instructor_availabilities_usecase.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/cancel_sessions_reasons_body.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/choose_new_dates_options_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

part 'cancelsession_state.dart';

class CancelSessionCubit extends Cubit<CancelSessionState> {
  CancelSessionCubit({
    required this.getInstructorAvailabilitiesUsecase,
    required this.getCancelSessionReasonsUsecase,
    required this.cancelSessionUsecase,
    required this.changeSessionDateUsecase,
  }) : super(CancelsessionInitial());
  List<bool> cancelSessionReasons = [];
  initCancelSessionReasons() {
    if (getCancelReasonsEntity?.data != null) {
      cancelSessionReasons =
          List.filled(getCancelReasonsEntity!.data!.length, false);
    }
  }

  bool noChosenReason() {
    bool allFalse = cancelSessionReasons.every((element) => element == false);
    return allFalse;
  }

  bool noDateTypeChosen() {
    if (chooseNewDateOption || cancelSession) {
      return false;
    } else {
      return true;
    }
  }

  void chooseCancelReasons(int index, bool value) {
    cancelSessionReasons[index] = value;
    int reasonId = getCancelReasonsEntity?.data?[index].id ?? -1;
    if (value) {
      if (!selectedReasonsIds.contains(reasonId)) {
        selectedReasonsIds.add(reasonId);
      }
    } else {
      selectedReasonsIds.remove(reasonId);
    }
    log("$selectedReasonsIds");
    emit(ChooseChangeLecturerReasonState());
  }

  List<int> selectedReasonsIds = [];

  int bodyIndex = 0;
  double linearIndicatorPercent = .25;
  void incrementBodyIndex() {
    if (bodyIndex < bodies.length) {
      if (cancelSession) {
        bodyIndex += 1;
        linearIndicatorPercent += .5;
      } else {
        bodyIndex++;
        linearIndicatorPercent += .25;
      }
    }
    emit(IncrementBodyIndexState());
  }

  void decrementBodyIndex(BuildContext context) {
    if (bodyIndex > 0) {
      if (cancelSession) {
        bodyIndex -= 1;
        linearIndicatorPercent -= .5;
      } else {
        bodyIndex--;
        linearIndicatorPercent -= .25;
      }
    } else {
      back(context);
    }
    emit(DecrementBodyIndexState());
  }

  bool chooseNewDateOption = false;
  bool cancelSession = false;
  void toggleChooseNewDateOption() {
    chooseNewDateOption = !chooseNewDateOption;
    cancelSession = false;
    emit(ToggleTimeTypeState());
  }

  void toggleCancelSession() {
    cancelSession = !cancelSession;
    chooseNewDateOption = false;
    emit(ToggleTimeTypeState());
  }

  List<Widget> bodies = [
    const CacnelSessionsReasonsBody(),
    const ChooseNewDatesOptionsBody(),
    // const SpecifyNewDatesBody(),
    // const ChooseProperLecturerBody(),
  ];

  bool getCancelReasonsLoader = false;
  GetCancelSessionReasonEntity? getCancelReasonsEntity;
  GetCancelSessionReasonsUsecase getCancelSessionReasonsUsecase;
  Future<void> getCancelReasons() async {
    getCancelReasonsLoader = true;
    emit(GetCancelReasonsLoadingState());
    final result = await getCancelSessionReasonsUsecase.call(
      parameter: NoParameter(),
    );
    result.fold(
      (failure) {
        getCancelReasonsLoader = false;
        emit(GetCancelReasonsErrorState(failure.message));
      },
      (data) {
        getCancelReasonsLoader = false;
        getCancelReasonsEntity = data;
        initCancelSessionReasons();
        emit(GetCancelReasonsSuccessState());
      },
    );
  }

  bool getInstructorAvailabilitiesLoader = false;
  GetInstructorAvailabilitiesEntity? getInstructorAvailabilitiesEntity;
  GetInstructorAvailabilitiesUsecase getInstructorAvailabilitiesUsecase;
  Future<void> getInstructorAvailabilities({
    required int instructorId,
    required int duration,
  }) async {
    getInstructorAvailabilitiesLoader = true;
    emit(GetInstructorAvailabilitiesLoadingState());
    final result = await getInstructorAvailabilitiesUsecase.call(
      parameter: GetInstructorAvailabilitiesParameters(
        instructorId: instructorId,
        duration: duration,
      ),
    );
    result.fold(
      (failure) {
        getInstructorAvailabilitiesLoader = false;
        emit(GetInstructorAvailabilitiesErrorState(failure.message));
      },
      (data) {
        getInstructorAvailabilitiesLoader = false;
        getInstructorAvailabilitiesEntity = data;
        emit(GetInstructorAvailabilitiesSuccessState());
      },
    );
  }

  bool changeSessionDateLoader = false;
  ChangeSessionDateEntity? changeSessionDateEntity;
  ChangeSessionDateUsecase changeSessionDateUsecase;

  bool postCancelSessionLoader = false;
  CancelSessionEntity? postCancelSessionEntity;
  CancelSessionUsecase cancelSessionUsecase;
  Future<void> postCancelSession(BuildContext context) async {
    int sessionId = context
            .read<LectureCubit>()
            .showProgramDetailsEntity
            ?.data
            ?.nextSession
            ?.id ??
        -1;
    log("cancel this session id $sessionId");
    postCancelSessionLoader = true;
    emit(PostCancelSessionLoadingState());
    final result = await cancelSessionUsecase.call(
      parameter: CancelSessionParameters(
        data: CancelSessionTojson(
          reasonsIds: selectedReasonsIds,
          sessionId: sessionId,
        ),
      ),
    );
    result.fold(
      (failure) {
        postCancelSessionLoader = false;
        emit(PostCancelSessionErrorState(failure.message));
      },
      (data) {
        delightfulToast(message: "${data.message}", context: context);
        Future.delayed(
          const Duration(milliseconds: 300),
          () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutePaths.layoutPath,
              (route) => false,
            );
          },
        );
        postCancelSessionLoader = false;
        postCancelSessionEntity = data;
        emit(PostCancelSessionSuccessState());
      },
    );
  }

  //! change date
  String specifiedDay = "";
  TextEditingController dayController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  String? selectedDayName;
  TimeOfDay? selectedTime;
  dynamic selectedTimeSlotData;

// تحديث دالة changeSessionDate لتستخدم البيانات المحفوظة
  Future<void> changeSessionDate({
    required int sessionId,
    // required BuildContext context,
  }) async {
    // التحقق من وجود البيانات المطلوبة
    if (dayController.text.isEmpty || selectedTimeSlotData == null) {
      log("Error: Day or time slot data not selected");
      emit(ChangeSessionDateErrorState("يرجى تحديد اليوم والوقت"));
      return;
    }

    changeSessionDateLoader = true;
    emit(ChangeSessionDateLoadingState());

    // استخراج الوقت من selectedTimeSlotData بدلاً من timeController
    String startTime = selectedTimeSlotData?.startTime ?? "";
    if (startTime.isEmpty) {
      log("Error: Start time is empty");
      emit(ChangeSessionDateErrorState("خطأ في بيانات الوقت"));
      return;
    }

    // التأكد من أن الوقت في فورمات HH:MM
    String formattedTime = startTime;
    if (startTime.length > 5) {
      formattedTime = startTime.substring(0, 5);
    }

    // الحصول على التاريخ المنسق
    String sessionDate = _formatSessionDate();
    if (sessionDate.isEmpty) {
      log("Error: Could not get session date");
      emit(ChangeSessionDateErrorState("خطأ في الحصول على تاريخ الجلسة"));
      return;
    }

    final changeSessionData = ChangeSessionDateTojson(
      day: dayController.text,
      sessionDate: sessionDate,
      sessionTime: formattedTime,
    );

    log("=== Sending change session request ===");
    log("Day: ${changeSessionData.day}");
    log("Session Date: ${changeSessionData.sessionDate}");
    log("Session Time: ${changeSessionData.sessionTime}");
    log("====================================");

    final result = await changeSessionDateUsecase.call(
      parameter: ChangeSessionDateParameters(
        data: changeSessionData,
        sessionId: sessionId,
      ),
    );

    result.fold(
      (failure) {
        changeSessionDateLoader = false;
        log("Change session date failed: ${failure.message}");
        emit(ChangeSessionDateErrorState(failure.message));
      },
      (data) {
        changeSessionDateLoader = false;
        changeSessionDateEntity = data;
        // Navigator.pushReplacementNamed(context, RoutePaths.layoutPath);
        log("Change session date success: ${data.message}");
        emit(ChangeSessionDateSuccessState());
      },
    );
  }

// دالة لتنسيق التاريخ حسب المطلوب من الـ API
  // دالة لتنسيق التاريخ حسب المطلوب من الـ API
  String _formatSessionDate() {
    // التحقق من وجود البيانات المطلوبة
    if (selectedDayName == null || selectedTimeSlotData == null) {
      log("Error: selectedDayName or selectedTimeSlotData is null");
      return "";
    }

    final availabilityData = getInstructorAvailabilitiesEntity?.data;
    if (availabilityData == null) {
      log("Error: No availability data found");
      return "";
    }

    // خريطة الأيام مع البيانات المقابلة
    final daysMap = {
      "Saturday": availabilityData.saturday,
      "Sunday": availabilityData.sunday,
      "Monday": availabilityData.monday,
      "Tuesday": availabilityData.tuesday,
      "Wednesday": availabilityData.wednesday,
      "Thursday": availabilityData.thursday,
      "Friday": availabilityData.friday,
    };

    // الحصول على بيانات اليوم المحدد
    final selectedDayData = daysMap[selectedDayName];
    if (selectedDayData == null || selectedDayData.isEmpty) {
      log("Error: No data found for selected day: $selectedDayName");
      return "";
    }

    // البحث عن الـ time slot المحدد للحصول على التاريخ الصحيح
    for (var timeSlot in selectedDayData) {
      if (timeSlot.startTime == selectedTimeSlotData.startTime &&
          timeSlot.endTime == selectedTimeSlotData.endTime) {
        String fullDate = timeSlot.fullDate.toString();
        log("Found matching time slot with original date: $fullDate");

        // تنسيق التاريخ ليكون في صورة YYYY-MM-DD فقط
        if (fullDate.isNotEmpty) {
          try {
            // تحويل التاريخ لـ DateTime ثم استخراج التاريخ فقط
            DateTime dateTime = DateTime.parse(fullDate);
            String formattedDate =
                "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
            log("Formatted date: $formattedDate");
            return formattedDate;
          } catch (e) {
            log("Error parsing date: $e");
            // في حالة فشل التحويل، نحاول استخراج التاريخ يدوياً
            if (fullDate.contains(' ')) {
              String datePart = fullDate.split(' ')[0];
              log("Extracted date part: $datePart");
              return datePart;
            }
            return fullDate;
          }
        }
        break;
      }
    }

    // إذا لم نجد تطابق، نحاول استخدام أول عنصر في اليوم المحدد
    if (selectedDayData.isNotEmpty) {
      String fallbackDate = selectedDayData[0].fullDate.toString();
      log("Using fallback date: $fallbackDate");

      if (fallbackDate.isNotEmpty) {
        try {
          DateTime dateTime = DateTime.parse(fallbackDate);
          String formattedDate =
              "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
          return formattedDate;
        } catch (e) {
          if (fallbackDate.contains(' ')) {
            return fallbackDate.split(' ')[0];
          }
          return fallbackDate;
        }
      }
    }

    log("Error: Could not find matching date for selected time slot");
    return "";
  }

  void saveSelectedScheduleData({
    required String dayName,
    required dynamic timeSlotData,
  }) {
    selectedDayName = dayName;
    selectedTimeSlotData = timeSlotData;

    // حفظ البيانات في الـ Controllers
    dayController.text = dayName;
    if (timeSlotData != null) {
      timeController.text =
          "${timeSlotData.startTime} - ${timeSlotData.endTime}";

      // طباعة جميع بيانات الـ time slot للتحقق
      log("=== Selected Time Slot Data ===");
      log("Day: $dayName");
      log("Start Time: ${timeSlotData.startTime}");
      log("End Time: ${timeSlotData.endTime}");
      log("Full Date: ${timeSlotData.fullDate}");
      log("================================");
    }

    emit(ChangeSpecifiedDayState());
  }

// دالة محسنة للتحقق من البيانات قبل الإرسال
  bool isScheduleDataComplete() {
    bool isComplete = dayController.text.isNotEmpty &&
        timeController.text.isNotEmpty &&
        selectedDayName != null &&
        selectedTimeSlotData != null &&
        selectedTimeSlotData.fullDate != null;

    log("Schedule data completeness check:");
    log("Day controller: ${dayController.text}");
    log("Time controller: ${timeController.text}");
    log("Selected day name: $selectedDayName");
    log("Selected time slot data: ${selectedTimeSlotData != null ? 'Available' : 'Null'}");
    log("Full date available: ${selectedTimeSlotData?.fullDate ?? 'Null'}");
    log("Is complete: $isComplete");

    return isComplete;
  }

  // دالة لمسح البيانات المحددة
  void clearSelectedScheduleData() {
    selectedDayName = null;
    selectedTimeSlotData = null;
    dayController.clear();
    timeController.clear();
    selectedTime = null;

    emit(ChangeSpecifiedDayState());
  }

  // تحديث دالة changeSpecifiedDay لتكون أكثر شمولية
  void changeSpecifiedDay(String day) {
    specifiedDay = day;
    dayController.text = day;
    selectedDayName = day;

    // مسح بيانات الوقت عند تغيير اليوم
    selectedTimeSlotData = null;
    timeController.clear();
    selectedTime = null;

    emit(ChangeSpecifiedDayState());
  }

  // دالة محسنة لتحديد الوقت
  void changeSelectedTimeSlot(dynamic timeSlot) {
    if (timeSlot != null) {
      selectedTimeSlotData = timeSlot;
      timeController.text = "${timeSlot.startTime} - ${timeSlot.endTime}";

      // يمكنك أيضاً تحويل الوقت إلى TimeOfDay إذا كان مطلوباً
      try {
        final startTimeParts = timeSlot.startTime.split(':');
        if (startTimeParts.length == 2) {
          selectedTime = TimeOfDay(
            hour: int.parse(startTimeParts[0]),
            minute: int.parse(startTimeParts[1]),
          );
        }
      } catch (e) {
        log("Error parsing time: $e");
      }

      emit(ChangeSelectedTimeState());
    }
  }
}
