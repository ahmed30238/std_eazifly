import 'dart:developer';
import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/data/models/change_instructor/change_instructor_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_instructors_tojson.dart';
import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/change_instructor_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_user_subscription_data_entity.dart';
import 'package:eazifly_student/domain/entities/get_instructors_entity.dart';
import 'package:eazifly_student/domain/use_cases/change_instructor_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_instructors_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_remaining_program_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_subscription_data_usecase.dart';
import 'package:eazifly_student/presentation/controller/change_lecturer_controller/changelecturer_state.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
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
  }) : super(ChangelecturerInitial());

  static ChangelecturerCubit get(context) => BlocProvider.of(context);
  // تعديل method getInstructors لتعمل بناءً على نوع المواعيد المختارة
  Future<void> getInstructors(BuildContext context) async {
    getInstructorsLoader = true;
    emit(GetInstructorsLoadingState());

    List<AddWeeklyAppontmentsDatumEntity> appointments = [];

    // إذا اختار المستخدم "نفس المواعيد" - استخدم المواعيد من getRemainingProgramSessions
    if (sameDates) {
      appointments = List.generate(
        getRemainingProgramSessionsEntity?.data?.length ?? 0,
        (index) {
          return AddWeeklyAppontmentsDatumEntity(
            end: getRemainingProgramSessionsEntity!.data![index].end,
            start: getRemainingProgramSessionsEntity!.data![index].start,
          );
        },
      );
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

    // إذا لم يكن هناك مواعيد، أرسل خطأ
    if (appointments.isEmpty) {
      getInstructorsLoader = false;
      emit(GetInstructorsErrorState("لا توجد مواعيد محددة"));
      return;
    }

    final result = await getInstructorsUsecase.call(
      parameter: GetInstructorsParameters(
        data: GetInstructorsTojson(
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

// تعديل method changeInstructor لتستخدم المواعيد المناسبة
  Future<void> changeInstructor(BuildContext context) async {
    changeInstructorLoader = true;
    emit(ChangeInstructorLoadingState());

    LectureCubit lectureCubit = context.read<LectureCubit>();
    var oldInstructorId = int.tryParse(lectureCubit
            .showProgramDetailsEntity?.data?.nextSession?.instructorId ??
        "-1");

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
      return;
    }

    final result = await changeInstructorUsecase.call(
      parameter: ChangeInstructorParameters(
        data: ChangeInstructorTojson(
          reasonToChangeInstructorIds:
              getSelectedReasonIds(), // استخدم الأسباب المختارة
          instructorId: getInstructorsEntity!.data!.isNotEmpty
              ? (getInstructorsEntity?.data?[selectedLecturerIndex].id ?? -1)
              : -1,
          programId: lectureCubit.currentProgramId,
          oldInstructorId: oldInstructorId ?? -1,
          userId: selectedStudentId,
          sessions: sessionsToSend, // استخدم المواعيد المناسبة
        ),
      ),
    );

    result.fold(
      (failure) {
        changeInstructorLoader = false;
        emit(ChangeInstructorErrorState(
          errorMessage: failure.message,
        ));
      },
      (data) {
        changeInstructorLoader = false;
        changeInstructorEntity = data;
        emit(ChangeInstructorSuccessState());
      },
    );
  }

// method مساعدة لتحديد أسباب تغيير المحاضر المختارة
  List<int> getSelectedReasonIds() {
    List<int> selectedReasons = [];
    for (int i = 0; i < changeLecturerReason.length; i++) {
      if (changeLecturerReason[i] == true) {
        selectedReasons.add(i + 1); // افتراض أن الـ IDs تبدأ من 1
      }
    }
    return selectedReasons.isEmpty
        ? [1]
        : selectedReasons; // إرجاع سبب افتراضي إذا لم يتم اختيار أي سبب
  }

// method مساعدة لطباعة معلومات debug
  void debugPrintSessionInfo() {
    log("=== Debug Session Info ===");
    log("sameDates: $sameDates");
    log("newDates: $newDates");

    if (sameDates) {
      log("Using getRemainingProgramSessionsEntity sessions:");
      log("Sessions count: ${getRemainingProgramSessionsEntity?.data?.length ?? 0}");
      getRemainingProgramSessionsEntity?.data?.forEach((session) {
        log("Session: ${session.start} - ${session.end}");
      });
    } else if (newDates) {
      log("Using specifiedDates sessions:");
      log("Sessions count: ${specifiedDates.length}");
      specifiedDates.forEach((session) {
        log("Session: ${session.start} - ${session.end}");
      });
    }
    log("=== End Debug Session Info ===");
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
          await getInstructors(context);
          bodyIndex += 2;
          linearIndicatorPercent += .5;
        } catch (e) {
          // في حالة الخطأ، ارجع للحالة السابقة
          print('Error in incrementBodyIndex (sameDates): $e');
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

// method جديدة لإنشاء المواعيد الأسبوعية
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

              // إنشاء تاريخ ووقت البداية
              DateTime startDateTime = DateTime(
                sessionDate.year,
                sessionDate.month,
                sessionDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );

              // إنشاء تاريخ ووقت النهاية (افتراض ساعة واحدة)
              DateTime endDateTime =
                  startDateTime.add(const Duration(hours: 1));

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
    log("Weekly appointments: ${specifiedDates.map((e) => '${e.start} - ${e.end}').toList()}");
  }

// تعديل method checkAndCallSpecifyAllDatesAppointments
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
      SpecifyAllSessionDatesChangeInstructor(),
    ];
  }

  List<TextEditingController> hoursControllers = [];
  List<TextEditingController> fromControllers = [];
  List<TextEditingController> toControllers = [];
  //! ui
  List<TextEditingController> specifyAlldayController = [];

  int selectedLecturerIndex = 0;
  changeLecturerIndex(int index) {
    selectedLecturerIndex = index;
    emit(ChangeLecturerIndexState());
  }

  void chooseLecturerReasons(int index, bool value) {
    changeLecturerReason[index] = value;
    emit(ChooseChangeLecturerReasonState());
  }

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

  //! API
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

        // إضافة controllers جديدة بناءً على العدد المطلوب
        for (int i = 0; i < numberOfSessionsPerWeek; i++) {
          dayController.add(TextEditingController());
          hoursControllers.add(TextEditingController());
        }
        for (int i = 0; i < numberOfSessions; i++) {
          specifyAlldayController.add(TextEditingController());
          fromControllers.add(TextEditingController());
          toControllers.add(TextEditingController());
        }

        // تهيئة أوقات الـ sessions
        initializeSessionTimes(numberOfSessionsPerWeek);
        initializeFromTimes(numberOfSessions); // تهيئة أوقات البداية
        initializeToTimes(numberOfSessions); // تهيئة أوقات النهاية

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

  void changeSelectedTime(
      TimeOfDay timeOfDay, int sessionIndex, BuildContext context) {
    selectedTimesOfDay[sessionIndex] = timeOfDay;
    final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period == DayPeriod.am ? 'ص' : 'م';
    selectedTimes[sessionIndex] = '$hour:$minute $period';

    // تحديث الـ controller الخاص بالـ session
    if (sessionIndex < hoursControllers.length) {
      hoursControllers[sessionIndex].text = selectedTimes[sessionIndex];
    }

    emit(ChangeSelectedTimeState());

    checkAndCallAddWeeklyAppointments(context);
  }

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

          // دمج التاريخ مع أوقات البداية والنهاية
          DateTime startDateTime = DateTime(
            targetDate.year,
            targetDate.month,
            targetDate.day,
            selectedFromTimes[i]!.hour,
            selectedFromTimes[i]!.minute,
          );

          DateTime endDateTime = DateTime(
            targetDate.year,
            targetDate.month,
            targetDate.day,
            selectedToTimes[i]!.hour,
            selectedToTimes[i]!.minute,
          );

          // إضافة الموعد إلى القائمة
          specifiedDates.add(
            GetRemainigProgramSessionsDatumEntity(
              id: getRemainingProgramSessionsEntity?.data?[i].id ?? -1,
              start: startDateTime,
              end: endDateTime,
            ),
          );
        }
      }
    }

    log("Specified dates filled: ${specifiedDates.length} appointments");
    log("Specified dates content: ${specifiedDates.map((e) => '${e.start} - ${e.end}').toList()}");
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

  void changeSelectedFromTime(
      BuildContext context, TimeOfDay timeOfDay, int sessionIndex) {
    selectedFromTimes[sessionIndex] = timeOfDay;
    final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period == DayPeriod.am ? 'ص' : 'م';
    selectedFromTimesDisplay[sessionIndex] = '$hour:$minute $period';

    // تحديث الـ controller الخاص بالـ session
    if (sessionIndex < fromControllers.length) {
      fromControllers[sessionIndex].text =
          selectedFromTimesDisplay[sessionIndex];
    }

    emit(ChangeSelectedFromTimeState());

    // فحص إذا كانت جميع الـ sessions مكتملة
    checkAndCallSpecifyAllDatesAppointments(context);
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

  void changeSelectedToTime(
      BuildContext context, TimeOfDay timeOfDay, int sessionIndex) {
    selectedToTimes[sessionIndex] = timeOfDay;
    final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period == DayPeriod.am ? 'ص' : 'م';
    selectedToTimesDisplay[sessionIndex] = '$hour:$minute $period';

    // تحديث الـ controller الخاص بالـ session
    if (sessionIndex < toControllers.length) {
      toControllers[sessionIndex].text = selectedToTimesDisplay[sessionIndex];
    }

    emit(ChangeSelectedToTimeState());

    // فحص إذا كانت جميع الـ sessions مكتملة
    checkAndCallSpecifyAllDatesAppointments(context);
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

  bool getInstructorsLoader = false;
  GetInstructorsEntity? getInstructorsEntity;
  GetInstructorsUsecase getInstructorsUsecase;
}
