import 'dart:developer';

import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/data/models/change_instructor/change_instructor_tojson.dart';
import 'package:eazifly_student/data/models/find_instructor/request_to_find_instructor_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_instructors_tojson.dart';
import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/change_instructor_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_change_instructor_reasons_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_user_subscription_data_entity.dart';
import 'package:eazifly_student/domain/entities/find_instructor/request_to_find_instructor_entity.dart';
import 'package:eazifly_student/domain/entities/get_instructors_entity.dart';
import 'package:eazifly_student/domain/use_cases/change_instructor_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_change_instructor_reasons.dart';
import 'package:eazifly_student/domain/use_cases/get_instructors_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_remaining_program_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_subscription_data_usecase.dart';
import 'package:eazifly_student/domain/use_cases/request_to_find_instructor_usecase.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/change_lecturer_reason_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/choose_dates_type_body.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/choose_proper_lecturer.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/repeat_week_session_to_change_instructor.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/specify_all_session_dates_change_instructor.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/change_lecturer_view/widgets/specify_new_dates_body.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart'
    hide InitTabBarControllerState;

class ChangelecturerCubit extends Cubit<ChangelecturerState> {
  ChangelecturerCubit({
    required this.getRemainingProgramSessionsUsecase,
    required this.getUserSubscriptionDataUsecase,
    required this.changeInstructorUsecase,
    required this.getInstructorsUsecase,
    required this.getChangeInstructorReasonsUsecase,
    required this.requestToFindInstructorUsecase,
  }) : super(ChangelecturerInitial());

  static ChangelecturerCubit get(context) => BlocProvider.of(context);
  // تعديل method getInstructors لتعمل بناءً على نوع المواعيد المختارة
  Future<void> getInstructors(BuildContext context) async {
    log("started");
    getInstructorsLoader = true;
    emit(GetInstructorsLoadingState());

    List<AddWeeklyAppontmentsDatumEntity> appointments = [];

    // إذا اختار المستخدم "نفس المواعيد" - استخدم المواعيد من getRemainingProgramSessions
    if (sameDates) {
      log("same start");
      appointments = List.generate(
        getRemainingProgramSessionsEntity?.data?.length ?? 0,
        (index) {
          return AddWeeklyAppontmentsDatumEntity(
            end: getRemainingProgramSessionsEntity!.data![index].end,
            start: getRemainingProgramSessionsEntity!.data![index].start,
          );
        },
      );
      log("same end");
    }
    // إذا اختار المستخدم "مواعيد جديدة" - استخدم المواعيد التي اختارها المستخدم
    else if (newDates) {
      appointments = List.generate(
        specifiedDates.length,
        (index) {
          return AddWeeklyAppontmentsDatumEntity(
            end: specifiedDates[index].end,
            start: specifiedDates[index].start,
          );
        },
      );
    }
    log("empty dates");
    // إذا لم يكن هناك مواعيد، أرسل خطأ
    if (appointments.isEmpty) {
      getInstructorsLoader = false;
      emit(GetInstructorsErrorState("لا توجد مواعيد محددة"));
      log("no error");
      return;
    }
    log("error");
    var oldInstructorId = context
        .read<MyProgramsCubit>()
        .getAssignedChildrenToProgramEntity
        ?.data?.first
        .currentInstructorId;

    log("$oldInstructorId is inst id");

    final result = await getInstructorsUsecase.call(
      parameter: GetInstructorsParameters(
        data: GetInstructorsTojson(
          instructorId: oldInstructorId,
          appointments: appointments,
          programId: context.read<LectureCubit>().currentProgramId,
        ),
      ),
    );

    result.fold(
      (failure) {
        getInstructorsLoader = false;
        emit(GetInstructorsErrorState(failure.message));
      },
      (data) {
        getInstructorsLoader = false;
        getInstructorsEntity = data;
        emit(GetInstructorsSuccessState());
      },
    );
  }

  // تحسين method createWeeklyAppointments لتتعامل مع أوقات صحيحة
  void createWeeklyAppointments() {
    specifiedDates.clear(); // مسح البيانات السابقة

    int numberOfSessionsPerWeek = int.tryParse(
            getUserSubscriptionDataEntity?.data?.numberOfSessionPerWeek ??
                "0") ??
        0;

    int totalSessions =
        getUserSubscriptionDataEntity?.data?.numberOfSessions ?? 0;

    // الحصول على التاريخ الحالي
    DateTime now = DateTime.now();

    // إنشاء جميع المواعيد بناءً على التكرار الأسبوعي
    int sessionCount = 0;
    int weekOffset = 0;

    while (sessionCount < totalSessions) {
      for (int i = 0;
          i < numberOfSessionsPerWeek && sessionCount < totalSessions;
          i++) {
        if (i < dayController.length && i < selectedTimesOfDay.length) {
          String selectedDayName = dayController[i].text;
          TimeOfDay? selectedTime = selectedTimesOfDay[i];

          if (selectedDayName.isNotEmpty && selectedTime != null) {
            // البحث عن رقم اليوم في الأسبوع
            int selectedDayIndex = WeekDaysEnum.values
                .indexWhere((day) => day.title == selectedDayName);

            if (selectedDayIndex != -1) {
              // حساب التاريخ للأسبوع الحالي + weekOffset
              DateTime targetWeekStart =
                  now.add(Duration(days: weekOffset * 7));

              // حساب الفرق بين اليوم الحالي واليوم المختار
              int daysDifference =
                  (selectedDayIndex + 1) - targetWeekStart.weekday;
              if (daysDifference < 0) {
                daysDifference += 7;
              }

              DateTime sessionDate =
                  targetWeekStart.add(Duration(days: daysDifference));

              // تصحيح الدقائق لتكون أوقات صحيحة (0, 15, 30, 45)
              int correctedMinute = _getCorrectedMinutes(selectedTime.minute);

              // إنشاء تاريخ ووقت البداية بأوقات صحيحة
              DateTime startDateTime = DateTime(
                sessionDate.year,
                sessionDate.month,
                sessionDate.day,
                selectedTime.hour,
                correctedMinute,
              );

              // إنشاء تاريخ ووقت النهاية (ساعة واحدة بأوقات صحيحة)
              DateTime endDateTime = _calculateEndTime(startDateTime);

              // إضافة الموعد إلى القائمة
              specifiedDates.add(
                GetRemainigProgramSessionsDatumEntity(
                  id: (getRemainingProgramSessionsEntity != null &&
                          getRemainingProgramSessionsEntity?.data != null &&
                          getRemainingProgramSessionsEntity!.data!.isNotEmpty)
                      ? getRemainingProgramSessionsEntity?.data![i].id ?? -1
                      : -1,
                  start: startDateTime,
                  end: endDateTime,
                ),
              );

              sessionCount++;
            }
          }
        }
      }
      weekOffset++; // الانتقال للأسبوع التالي
    }

    log("Weekly appointments created: ${specifiedDates.length} sessions");
    log("Weekly appointments: ${specifiedDates.map((e) => '${_formatDateTime(e.start ?? DateTime.now())} - ${_formatDateTime(e.end ?? DateTime.now())}').toList()}");
  }

// تحسين method specifyAllDatesAppointments لتتعامل مع أوقات صحيحة
  void specifyAllDatesAppointments() {
    specifiedDates.clear(); // مسح البيانات السابقة

    int numberOfSessions =
        getUserSubscriptionDataEntity?.data?.numberOfSessions ?? 0;

    for (int i = 0; i < numberOfSessions; i++) {
      if (i < specifyAlldayController.length &&
          i < selectedFromTimes.length &&
          i < selectedToTimes.length &&
          specifyAlldayController[i].text.isNotEmpty &&
          selectedFromTimes[i] != null &&
          selectedToTimes[i] != null) {
        // الحصول على اليوم المختار
        String selectedDay = specifyAlldayController[i].text;

        // الحصول على التاريخ الحالي
        DateTime now = DateTime.now();

        // البحث عن أقرب يوم مطابق في الأسبوع
        int selectedDayIndex =
            WeekDaysEnum.values.indexWhere((day) => day.title == selectedDay);

        if (selectedDayIndex != -1) {
          // حساب الفرق بين اليوم الحالي واليوم المختار
          int daysDifference = (selectedDayIndex + 1) - now.weekday;
          if (daysDifference <= 0) {
            daysDifference += 7; // إذا كان اليوم قد مر، اختر الأسبوع القادم
          }

          DateTime targetDate = now.add(Duration(days: daysDifference));

          // تصحيح أوقات البداية والنهاية لتكون أوقات صحيحة
          int correctedFromMinute =
              _getCorrectedMinutes(selectedFromTimes[i]!.minute);
          int correctedToMinute =
              _getCorrectedMinutes(selectedToTimes[i]!.minute);

          // دمج التاريخ مع أوقات البداية والنهاية المصححة
          DateTime startDateTime = DateTime(
            targetDate.year,
            targetDate.month,
            targetDate.day,
            selectedFromTimes[i]!.hour,
            correctedFromMinute,
          );

          DateTime endDateTime = DateTime(
            targetDate.year,
            targetDate.month,
            targetDate.day,
            selectedToTimes[i]!.hour,
            correctedToMinute,
          );

          // التأكد من أن وقت النهاية بعد وقت البداية
          if (endDateTime.isBefore(startDateTime) ||
              endDateTime.isAtSameMomentAs(startDateTime)) {
            endDateTime = _calculateEndTime(startDateTime);
          }

          // إضافة الموعد إلى القائمة
          specifiedDates.add(
            GetRemainigProgramSessionsDatumEntity(
              // id: getRemainingProgramSessionsEntity?.data?[i].id ?? -1,
              start: startDateTime,
              end: endDateTime,
            ),
          );
        }
      }
    }

    log("Specified dates filled: ${specifiedDates.length} appointments");
    log("Specified dates content: ${specifiedDates.map((e) => '${_formatDateTime(e.start ?? DateTime.now())} - ${_formatDateTime(e.end ?? DateTime.now())}').toList()}");
  }

// method مساعدة لتصحيح الدقائق لتكون أوقات صحيحة (0, 15, 30, 45)
  int _getCorrectedMinutes(int originalMinutes) {
    if (originalMinutes <= 7) {
      return 0; // ساعة كاملة
    } else if (originalMinutes <= 22) {
      return 15; // ربع ساعة
    } else if (originalMinutes <= 37) {
      return 30; // نصف ساعة
    } else if (originalMinutes <= 52) {
      return 45; // ثلاثة أرباع ساعة
    } else {
      return 0; // ساعة كاملة للساعة التالية (سيتم التعامل معها في حساب الساعة)
    }
  }

// method مساعدة لحساب وقت النهاية (ساعة واحدة من وقت البداية)
  DateTime _calculateEndTime(DateTime startTime) {
    // إضافة ساعة واحدة مع الحفاظ على الأوقات الصحيحة
    DateTime endTime = startTime.add(const Duration(hours: 1));

    // تصحيح الدقائق إذا لزم الأمر
    int correctedMinute = _getCorrectedMinutes(endTime.minute);

    return DateTime(
      endTime.year,
      endTime.month,
      endTime.day,
      endTime.hour,
      correctedMinute,
    );
  }

// method مساعدة لتنسيق عرض التاريخ والوقت
  String _formatDateTime(DateTime dateTime) {
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String year = dateTime.year.toString();
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');

    return '$day/$month/$year $hour:$minute';
  }

// تحسين method changeSelectedTime لتستخدم أوقات صحيحة
  void changeSelectedTime(
      TimeOfDay timeOfDay, int sessionIndex, BuildContext context) {
    // تصحيح الدقائق لتكون أوقات صحيحة
    int correctedMinute = _getCorrectedMinutes(timeOfDay.minute);
    int correctedHour = timeOfDay.hour;

    // إذا كانت الدقائق الأصلية > 52، أضف ساعة واجعل الدقائق 0
    if (timeOfDay.minute > 52) {
      correctedHour = (correctedHour + 1) % 24;
      correctedMinute = 0;
    }

    TimeOfDay correctedTime =
        TimeOfDay(hour: correctedHour, minute: correctedMinute);

    selectedTimesOfDay[sessionIndex] = correctedTime;

    // تنسيق الوقت للعرض
    final hour =
        correctedTime.hourOfPeriod == 0 ? 12 : correctedTime.hourOfPeriod;
    final minute = correctedTime.minute.toString().padLeft(2, '0');
    final period = correctedTime.period == DayPeriod.am ? 'ص' : 'م';
    selectedTimes[sessionIndex] = '$hour:$minute $period';

    // تحديث الـ controller الخاص بالـ session
    if (sessionIndex < hoursControllers.length) {
      hoursControllers[sessionIndex].text = selectedTimes[sessionIndex];
    }

    emit(ChangeSelectedTimeState());
    checkAndCallAddWeeklyAppointments(context);
  }

// تحسين method changeSelectedFromTime لتستخدم أوقات صحيحة
  void changeSelectedFromTime(
      BuildContext context, TimeOfDay timeOfDay, int sessionIndex) {
    // تصحيح الدقائق لتكون أوقات صحيحة
    int correctedMinute = _getCorrectedMinutes(timeOfDay.minute);
    int correctedHour = timeOfDay.hour;

    // إذا كانت الدقائق الأصلية > 52، أضف ساعة واجعل الدقائق 0
    if (timeOfDay.minute > 52) {
      correctedHour = (correctedHour + 1) % 24;
      correctedMinute = 0;
    }

    TimeOfDay correctedTime =
        TimeOfDay(hour: correctedHour, minute: correctedMinute);

    selectedFromTimes[sessionIndex] = correctedTime;

    // تنسيق الوقت للعرض
    final hour =
        correctedTime.hourOfPeriod == 0 ? 12 : correctedTime.hourOfPeriod;
    final minute = correctedTime.minute.toString().padLeft(2, '0');
    final period = correctedTime.period == DayPeriod.am ? 'ص' : 'م';
    selectedFromTimesDisplay[sessionIndex] = '$hour:$minute $period';

    // تحديث الـ controller الخاص بالـ session
    if (sessionIndex < fromControllers.length) {
      fromControllers[sessionIndex].text =
          selectedFromTimesDisplay[sessionIndex];
    }

    emit(ChangeSelectedFromTimeState());
    checkAndCallSpecifyAllDatesAppointments(context);
  }

// تحسين method changeSelectedToTime لتستخدم أوقات صحيحة
  void changeSelectedToTime(
      BuildContext context, TimeOfDay timeOfDay, int sessionIndex) {
    // تصحيح الدقائق لتكون أوقات صحيحة
    int correctedMinute = _getCorrectedMinutes(timeOfDay.minute);
    int correctedHour = timeOfDay.hour;

    // إذا كانت الدقائق الأصلية > 52، أضف ساعة واجعل الدقائق 0
    if (timeOfDay.minute > 52) {
      correctedHour = (correctedHour + 1) % 24;
      correctedMinute = 0;
    }

    TimeOfDay correctedTime =
        TimeOfDay(hour: correctedHour, minute: correctedMinute);

    selectedToTimes[sessionIndex] = correctedTime;

    // تنسيق الوقت للعرض
    final hour =
        correctedTime.hourOfPeriod == 0 ? 12 : correctedTime.hourOfPeriod;
    final minute = correctedTime.minute.toString().padLeft(2, '0');
    final period = correctedTime.period == DayPeriod.am ? 'ص' : 'م';
    selectedToTimesDisplay[sessionIndex] = '$hour:$minute $period';

    // تحديث الـ controller الخاص بالـ session
    if (sessionIndex < toControllers.length) {
      toControllers[sessionIndex].text = selectedToTimesDisplay[sessionIndex];
    }

    emit(ChangeSelectedToTimeState());
    checkAndCallSpecifyAllDatesAppointments(context);
  }

// إضافة method لعرض TimePicker مع أوقات صحيحة فقط
  Future<void> showCorrectedTimePicker(
      BuildContext context, int sessionIndex, String timeType) async {
    TimeOfDay initialTime;
    switch (timeType) {
      case 'session':
        initialTime = selectedTimesOfDay[sessionIndex] ?? TimeOfDay.now();
        break;
      case 'from':
        initialTime = selectedFromTimes[sessionIndex] ?? TimeOfDay.now();
        break;
      case 'to':
        initialTime = selectedToTimes[sessionIndex] ?? TimeOfDay.now();
        break;
      default:
        initialTime = TimeOfDay.now();
    }

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
      helpText: 'اختر وقت صحيح (أرباع الساعة)',
    );

    if (picked != null) {
      switch (timeType) {
        case 'session':
          changeSelectedTime(picked, sessionIndex, context);
          break;
        case 'from':
          changeSelectedFromTime(context, picked, sessionIndex);
          break;
        case 'to':
          changeSelectedToTime(context, picked, sessionIndex);
          break;
      }
    }
  }

// method لاقتراح أوقات صحيحة
  List<TimeOfDay> getSuggestedTimes() {
    List<TimeOfDay> suggestedTimes = [];

    // إنشاء أوقات مقترحة كل ربع ساعة من 6 صباحاً إلى 11 مساءً
    for (int hour = 6; hour <= 23; hour++) {
      for (int minute in [0, 15, 30, 45]) {
        suggestedTimes.add(TimeOfDay(hour: hour, minute: minute));
      }
    }

    return suggestedTimes;
  }

// تعديل method changeInstructor لتستخدم المواعيد المناسبة
  Future<void> changeInstructor(BuildContext context) async {
    changeInstructorLoader = true;
    emit(ChangeInstructorLoadingState());

    MyProgramsCubit myProgramsCubit = context.read<MyProgramsCubit>();
    var oldInstructorId =
        myProgramsCubit.getAssignedChildrenToProgramEntity?.data?.first.currentInstructorId; // TODO

    // تحديد المواعيد المناسبة بناءً على اختيار المستخدم
    List<GetRemainigProgramSessionsDatumEntity> sessionsToSend = [];

    if (sameDates) {
      // إذا اختار نفس المواعيد، استخدم المواعيد من getRemainingProgramSessions
      sessionsToSend = getRemainingProgramSessionsEntity?.data ?? [];
    } else if (newDates) {
      // إذا اختار مواعيد جديدة، استخدم المواعيد المحددة يدوياً
      sessionsToSend = specifiedDates;
    }

    // التحقق من وجود مواعيد قبل الإرسال
    if (sessionsToSend.isEmpty) {
      changeInstructorLoader = false;
      emit(ChangeInstructorErrorState(
        errorMessage: "لا توجد مواعيد محددة لتغيير المحاضر",
      ));
      delightfulToast(
          message: "لا يوجد مواعيد محددة لتغيير المحاضر", context: context);
      return;
    }
    int instructorId = getInstructorsEntity!.data!.isNotEmpty
        ? (getInstructorsEntity?.data?[selectedLecturerIndex].id ?? -1)
        : -1;
    if (instructorId == -1) {
      delightfulToast(message: "لم يتم اختيار معلم محدد", context: context);
      changeInstructorLoader = false;
      emit(
        ChangeInstructorErrorState(errorMessage: "لم يتم اختيار معلم محدد"),
      );
      return;
    }
    log("is new dates $newDates");

    final result = await changeInstructorUsecase.call(
      parameter: ChangeInstructorParameters(
        isNewDate: newDates,
        data: ChangeInstructorTojson(
          reasonToChangeInstructorIds: getSelectedReasonIds(),
          instructorId: instructorId,
          programId: context.read<LectureCubit>().currentProgramId,
          oldInstructorId: oldInstructorId ?? -1,
          userId: selectedStudentId,
          sessions: sessionsToSend,
        ),
      ),
    );

    result.fold(
      (failure) {
        changeInstructorLoader = false;
        emit(ChangeInstructorErrorState(
          errorMessage: failure.message,
        ));
        delightfulToast(message: failure.message, context: context);
      },
      (data) {
        changeInstructorLoader = false;
        changeInstructorEntity = data;
        Navigator.pushReplacementNamed(
          context,
          RoutePaths.lectureView,
          arguments: {
            "programId": context.read<LectureCubit>().currentProgramId,
          },
        );
        emit(ChangeInstructorSuccessState());
        delightfulToast(message: "تم تغيير المعلم بجاح", context: context);
      },
    );
  }

// method مساعدة لتحديد أسباب تغيير المحاضر المختارة
  List<int> getSelectedReasonIds() {
    List<int> selectedReasons = [];
    for (int i = 0; i < changeLecturerReason.length; i++) {
      if (changeLecturerReason[i] == true) {
        selectedReasons.add(i + 1);
      }
    }
    return selectedReasons.isEmpty ? [1] : selectedReasons;
  }

// تعديل method incrementBodyIndex
  void incrementBodyIndex(BuildContext context) async {
    if (bodyIndex < bodies.length - 1) {
      if (sameDates) {
        // إذا اختار نفس المواعيد، احصل على المواعيد المتبقية أولاً ثم المحاضرين
        try {
          await getRemainingProgramSessions(
            programId: context.read<LectureCubit>().currentProgramId,
            userId: selectedStudentId,
          );
          log("here");
          await getInstructors(context);
          bodyIndex += 2;
          linearIndicatorPercent += .5;
        } catch (e) {
          // في حالة الخطأ، ارجع للحالة السابقة
          log('Error in incrementBodyIndex (sameDates): $e');
          return;
        }
      } else if (newDates) {
        // إذا اختار مواعيد جديدة، احصل على المحاضرين بناءً على المواعيد المحددة
        try {
          await getInstructors(context);
          bodyIndex++;
          linearIndicatorPercent += .25;
        } catch (e) {
          // في حالة الخطأ، ارجع للحالة السابقة
          log('Error in incrementBodyIndex (newDates): $e');
          return;
        }
      } else {
        // إذا لم يختر نوع المواعيد بعد، اذهب للخطوة التالية فقط
        bodyIndex++;
        linearIndicatorPercent += .25;
      }
    }
    emit(IncrementBodyIndexState());
  }

  void checkAndCallAddWeeklyAppointments(BuildContext context) async {
    // التحقق من أن جميع الـ sessions لها أيام وأوقات محددة
    bool allSessionsComplete = true;

    for (int i = 0; i < dayController.length; i++) {
      if (dayController[i].text.isEmpty ||
          i >= selectedTimesOfDay.length ||
          selectedTimesOfDay[i] == null) {
        allSessionsComplete = false;
        break;
      }
    }

    // إذا كانت جميع الـ sessions مكتملة، أنشئ المواعيد الأسبوعية
    if (allSessionsComplete) {
      createWeeklyAppointments(); // إنشاء المواعيد الأسبوعية
      await getRemainingProgramSessions(
        programId: context.read<LectureCubit>().currentProgramId,
        userId: selectedStudentId,
      );
    }
  }

  void checkAndCallSpecifyAllDatesAppointments(BuildContext context) async {
    // التحقق من أن جميع الـ sessions لها أيام وأوقات محددة (from & to)
    bool allSessionsComplete = true;
    int numberOfSessions =
        getUserSubscriptionDataEntity?.data?.numberOfSessions ?? 0;

    for (int i = 0; i < numberOfSessions; i++) {
      // التحقق من وجود اليوم
      if (i >= specifyAlldayController.length ||
          specifyAlldayController[i].text.isEmpty) {
        allSessionsComplete = false;
        break;
      }

      // التحقق من وجود وقت البداية
      if (i >= selectedFromTimes.length || selectedFromTimes[i] == null) {
        allSessionsComplete = false;
        break;
      }

      // التحقق من وجود وقت النهاية
      if (i >= selectedToTimes.length || selectedToTimes[i] == null) {
        allSessionsComplete = false;
        break;
      }
    }

    // إذا كانت جميع الـ sessions مكتملة، قم بإعداد المواعيد المحددة فقط
    if (allSessionsComplete && numberOfSessions > 0) {
      specifyAllDatesAppointments();
      // لا تستدعي getInstructors هنا لأنه سيتم استدعاؤها في incrementBodyIndex
      log("All sessions completed - specifyAllDatesAppointments called");
    }
  }

  List<bool> changeLecturerReason = [];
  bool noChosenReason() {
    bool allFalse = changeLecturerReason.every((element) => element == false);
    return allFalse;
  }

  bool noDateTypeChosen() {
    if (newDates || sameDates) {
      return false;
    } else {
      return true;
    }
  }

  final GlobalKey<FormState> repeatedFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> specifiedFormKey = GlobalKey<FormState>();

  List<TextEditingController> dayController = [];
  changeSpecifiedDay(String day, int sessionIndex) {
    dayController[sessionIndex].text = day;
    emit(ChangeSpecifiedDayState());
  }

  //! ui
  final List<String> tabs = [
    "مواعيد ثابتة",
    'مواعيد مرنة',
  ];
  int tapbarIndex = 0;

  void changeTapbarIndex(int index) {
    tapbarIndex = index;
    emit(ChangeTapBarIndexState());
  }

  TabController? controller;
  void initTabBarController(TickerProvider vsync) {
    controller = TabController(length: tabs.length, vsync: vsync);
    controller?.addListener(() {
      if (controller!.indexIsChanging) {
        controller?.animateTo(
          controller!.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
      emit(InitTabBarControllerState());
    });
  }

  TabController? fixedDateController;
  void initFixedDateTabBarController(TickerProvider vsync) {
    fixedDateController = TabController(length: tabs.length, vsync: vsync);
    fixedDateController?.addListener(() {
      if (fixedDateController!.indexIsChanging) {
        fixedDateController?.animateTo(
          fixedDateController!.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
      emit(InitFixedTabBarControllerState());
    });
  }

  List<Widget> subTabbarBody({
    required BuildContext context,
  }) {
    return [
      const RepeatWeekSessionToChangeInstructor(),
      const SpecifyAllSessionDatesChangeInstructor(),
    ];
  }

  List<TextEditingController> hoursControllers = [];
  List<TextEditingController> fromControllers = [];
  List<TextEditingController> toControllers = [];
  //! ui
  List<TextEditingController> specifyAlldayController = [];

  int selectedLecturerIndex = -1;
  changeLecturerIndex(int index) {
    selectedLecturerIndex = index;
    emit(ChangeLecturerIndexState());
  }

  initChangeLecturerSessionReasons() {
    if (getChangeInstructorReasonsEntity?.data != null) {
      changeLecturerReason =
          List.filled(getChangeInstructorReasonsEntity!.data!.length, false);
    }
  }

  void chooseLecturerReasons(int index, bool value) {
    changeLecturerReason[index] = value;
    int reasonId = getChangeInstructorReasonsEntity?.data?[index].id ?? -1;
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

// تعديل method decrementBodyIndex
  void decrementBodyIndex(BuildContext context) {
    if (bodyIndex > 0) {
      if (sameDates && bodyIndex >= 2) {
        // التأكد من أن bodyIndex لا يصبح سالب
        bodyIndex -= 2;
        linearIndicatorPercent -= .5;
      } else if (newDates || (!sameDates && !newDates)) {
        bodyIndex--;
        linearIndicatorPercent -= .25;
      } else {
        // إذا كان bodyIndex = 1 و sameDates = true، ارجع خطوة واحدة فقط
        bodyIndex--;
        linearIndicatorPercent -= .25;
      }
    } else {
      back(context);
    }
    emit(DecrementBodyIndexState());
  }

  bool sameDates = false;
  bool newDates = false;
  void toggleSameDates() {
    sameDates = !sameDates;
    newDates = false;
    emit(ToggleTimeTypeState());
  }

  void toggleNewDates() {
    newDates = !newDates;
    sameDates = false;
    emit(ToggleTimeTypeState());
  }

  List<Widget> bodies = [
    const ChangeLecturerReasonBody(),
    const ChooseDatesTypeBody(),
    const SpecifyNewDatesBody(),
    const ChooseProperLecturerBody(),
  ];

  String specifiedDay = "";

  int selectedStudent = -1;
  int selectedStudentId = -1;

  void changeSelectedStudent(int val, int userId) {
    log("before $selectedStudent");
    selectedStudent = val;
    selectedStudentId = userId;
    log("after $selectedStudent");
    log("user id $selectedStudentId");
    emit(ChangeSelectedStdentState());
  }

  //! API Variables
  bool changeInstructorLoader = false;
  ChangeInstructorEntity? changeInstructorEntity;
  ChangeInstructorUsecase changeInstructorUsecase;

  bool getUserSubscriptionDataLoader = false;
  GetUserSubscriptionDataEntity? getUserSubscriptionDataEntity;
  GetUserSubscriptionDataUsecase getUserSubscriptionDataUsecase;

  bool getRemainingProgramSessionsLoader = false;
  GetRemainingProgramSessionsEntity? getRemainingProgramSessionsEntity;
  GetRemainingProgramSessionsUsecase getRemainingProgramSessionsUsecase;

  //! API Methods
  Future<void> getUserSubscriptionData({
    required int programId,
    required int userId,
  }) async {
    getUserSubscriptionDataLoader = true;
    emit(GetUserSubscriptionDataLoadingState());

    final result = await getUserSubscriptionDataUsecase.call(
      parameter: GetUserSubscriptionDataParameters(
        programId: programId,
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        getUserSubscriptionDataLoader = false;
        emit(GetUserSubscriptionDataErrorState(
          errorMessage: failure.message,
        ));
      },
      (data) {
        getUserSubscriptionDataLoader = false;
        getUserSubscriptionDataEntity = data;

        int numberOfSessionsPerWeek = int.tryParse(
                getUserSubscriptionDataEntity?.data?.numberOfSessionPerWeek ??
                    "0") ??
            0;
        int numberOfSessions =
            getUserSubscriptionDataEntity?.data?.numberOfSessions ?? 0;

        // مسح القوائم السابقة
        for (var controller in dayController) {
          controller.dispose();
        }
        for (var controller in specifyAlldayController) {
          controller.dispose();
        }
        for (var controller in hoursControllers) {
          controller.dispose();
        }
        for (var controller in fromControllers) {
          controller.dispose();
        }
        for (var controller in toControllers) {
          controller.dispose();
        }

        // إنشاء قوائم جديدة
        dayController.clear();
        specifyAlldayController.clear();
        hoursControllers.clear();
        fromControllers.clear();
        toControllers.clear();

        for (int i = 0; i < numberOfSessionsPerWeek; i++) {
          dayController.add(TextEditingController());
          hoursControllers.add(TextEditingController());
        }
        for (int i = 0; i < numberOfSessions; i++) {
          specifyAlldayController.add(TextEditingController());
          fromControllers.add(TextEditingController());
          toControllers.add(TextEditingController());
        }

        initializeSessionTimes(numberOfSessionsPerWeek);
        initializeFromTimes(numberOfSessions);
        initializeToTimes(numberOfSessions);

        emit(GetUserSubscriptionDataSuccessState());
      },
    );
  }

  List<TimeOfDay?> selectedToTimes = [];
  List<String> selectedToTimesDisplay = [];
  List<TimeOfDay?> selectedFromTimes = [];
  List<String> selectedFromTimesDisplay = [];
  List<TimeOfDay?> selectedTimesOfDay = [];
  List<String> selectedTimes = [];
  void initializeToTimes(int numberOfSessions) {
    selectedToTimes = List.filled(numberOfSessions, null);
    selectedToTimesDisplay = List.filled(numberOfSessions, "24 ساعة");
  }

  void initializeFromTimes(int numberOfSessions) {
    selectedFromTimes = List.filled(numberOfSessions, null);
    selectedFromTimesDisplay = List.filled(numberOfSessions, "24 ساعة");
  }

  List<GetRemainigProgramSessionsDatumEntity> specifiedDates = [];
  Future<void> showTimePickerDialog(
      BuildContext context, int sessionIndex) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimesOfDay[sessionIndex] ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      changeSelectedTime(picked, sessionIndex, context);
    }
  }

// في الـ constructor أو في initState
  void initializeSessionTimes(int numberOfSessions) {
    selectedTimesOfDay = List.filled(numberOfSessions, null);
    selectedTimes = List.filled(numberOfSessions, "24 ساعة");
  }

  changeSpecifiedAllDay(BuildContext context, String day, int sessionIndex) {
    if (sessionIndex < specifyAlldayController.length) {
      specifyAlldayController[sessionIndex].text = day;
      emit(ChangeSpecifiedDayState());

      // فحص إذا كانت جميع الـ sessions مكتملة
      checkAndCallSpecifyAllDatesAppointments(context);
    }
  }

  Future<void> showFromTimePickerDialog(
    BuildContext context,
    int sessionIndex,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedFromTimes[sessionIndex] ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      changeSelectedFromTime(context, picked, sessionIndex);
    }
  }

  Future<void> showToTimePickerDialog(
      BuildContext context, int sessionIndex) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedToTimes[sessionIndex] ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null) {
      changeSelectedToTime(context, picked, sessionIndex);
    }
  }

  List<bool> chosenDays = [];
  int limit = 3;
  void changeChosenDays(int index) {
    chosenDays[index] = !chosenDays[index];
    emit(ChangeChosenDaysState());
  }

  Future<void> getRemainingProgramSessions({
    required int programId,
    required int userId,
  }) async {
    getRemainingProgramSessionsLoader = true;
    emit(GetRemainingProgramSessionsLoadingState());

    final result = await getRemainingProgramSessionsUsecase.call(
      parameter: GetRemainingProgramSessionsParameters(
        programId: programId,
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        getRemainingProgramSessionsLoader = false;
        emit(GetRemainingProgramSessionsErrorState(
          errorMessage: failure.message,
        ));
      },
      (data) {
        getRemainingProgramSessionsLoader = false;
        getRemainingProgramSessionsEntity = data;
        emit(GetRemainingProgramSessionsSuccessState());
      },
    );
  }

  bool getChangeInstructorReasonsLoader = false;

  GetChangeInstructorReasonsEntity? getChangeInstructorReasonsEntity;
  GetChangeInstructorReasonsUsecase getChangeInstructorReasonsUsecase;

  Future<void> getChangeInstructorReasons() async {
    getChangeInstructorReasonsLoader = true;
    emit(GetChangeInstructorReasonsLoadingState());

    final result =
        await getChangeInstructorReasonsUsecase.call(parameter: NoParameter());

    result.fold(
      (failure) {
        getChangeInstructorReasonsLoader = false;
        emit(GetChangeInstructorReasonsErrorState(
          failure.message,
        ));
      },
      (data) {
        getChangeInstructorReasonsLoader = false;
        getChangeInstructorReasonsEntity = data;
        initChangeLecturerSessionReasons();
        emit(GetChangeInstructorReasonsSuccessState());
      },
    );
  }

  bool getInstructorsLoader = false;
  GetInstructorsEntity? getInstructorsEntity;
  GetInstructorsUsecase getInstructorsUsecase;
  RequestToFindInstructorUsecase requestToFindInstructorUsecase;
  RequestToFindInstructorEntity? requestToFindInstructorEntity;
  bool requestTofindInstructorLoader = false;
  Future<void> findInstructor({required BuildContext context}) async {
    requestTofindInstructorLoader = true;
    List<GetRemainigProgramSessionsDatumEntity> sessionsToSend = [];

    if (sameDates) {
      sessionsToSend = getRemainingProgramSessionsEntity?.data ?? [];
    } else if (newDates) {
      sessionsToSend = specifiedDates;
    }

    if (sessionsToSend.isEmpty) {
      requestTofindInstructorLoader = false;
      emit(ChangeInstructorErrorState(
        errorMessage: "لا توجد مواعيد محددة لتغيير المحاضر",
      ));
      delightfulToast(
          message: "لا يوجد مواعيد محددة لتغيير المحاضر", context: context);
      return;
    }
    emit(FindInstructorLoadingState());
    log("sessions $sessionsToSend");
    log("user id $selectedStudentId");
    log("p id ${context.read<LectureCubit>().currentProgramId.toString()}");
    var contentId =
        context.read<MyProgramsCubit>().getAssignedChildrenToProgramEntity?.data?.first.contentId;

    final result = await requestToFindInstructorUsecase.call(
      parameter: RequestToFindInstructorParameters(
        data: RequestToFindInstructorTojson(
          sessions: sessionsToSend,
          userId: selectedStudentId.toString(),
          contentId: contentId ?? "0",
          programId: context.read<LectureCubit>().currentProgramId.toString(),
        ),
      ),
    );

    result.fold(
      (l) {
        requestTofindInstructorLoader = false;
        emit(FindInstructorErrorState(errorMessage: l.message));
      },
      (r) {
        requestTofindInstructorLoader = false;
        requestToFindInstructorEntity = r;
        emit(FindInstructorSuccessState());
        delightfulToast(message: "تم ارسال الطلب بنجاح", context: context);
        Navigator.pushNamed(context, RoutePaths.lectureView, arguments: {
          "programId": context.read<LectureCubit>().currentProgramId
        });
      },
    );
  }
}
