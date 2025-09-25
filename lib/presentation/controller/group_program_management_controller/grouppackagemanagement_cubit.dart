// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/core/service_locator/service_locator.dart';
import 'package:eazifly_student/data/models/find_instructor/request_to_find_instructor_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/create_meeting_sessions_tojson.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_instructors_tojson.dart';
import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';
import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:eazifly_student/domain/entities/create_meeting_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/find_instructor/request_to_find_instructor_entity.dart';
import 'package:eazifly_student/domain/entities/get_instructors_entity.dart';
import 'package:eazifly_student/domain/entities/get_order_details_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_program_content_entity.dart';
import 'package:eazifly_student/domain/entities/user/add_user_session_date_and_time_entity.dart';
import 'package:eazifly_student/domain/use_cases/add_user_session_date_and_time_usecase.dart';
import 'package:eazifly_student/domain/use_cases/add_weekly_appointments_usecase.dart';
import 'package:eazifly_student/domain/use_cases/create_meeting_assignment_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_children_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_instructors_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_order_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_content_usecase.dart';
import 'package:eazifly_student/domain/use_cases/request_to_find_instructor_usecase.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/controller/layout/layout_cubit.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_lecturer.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/chosen_student_body.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/repeated_weekly_session.dart';
import 'package:eazifly_student/presentation/view/group_package_management_view/widgets/specify_all_sessions_dates.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
import 'package:intl/intl.dart';

import '../../../data/models/user/add_user_session_date_and_time_tojson.dart';

part 'grouppackagemanagement_state.dart';

class GroupPackageManagementCubit extends Cubit<GroupPackageManagementState> {
  GroupPackageManagementCubit({
    required this.getChildrenUsecase,
    required this.addWeeklyAppointmentsUsecase,
    required this.createMeetingSessionsUsecase,
    required this.getOrderDetailsUsecase,
    required this.getInstructorsUsecase,
    required this.getProgramContentUsecase,
    required this.requestToFindInstructorUsecase,
    required this.addUserSessionDateAndTimeUseCase,
  }) : super(GroupPackageManagementInitial());

  //! ui
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

  List<TextEditingController> dayController = [];

  changeSpecifiedDay(String day, int sessionIndex) {
    dayController[sessionIndex].text = day;
    emit(ChangeSpecifiedDayState());
  }

  Future<void> showUnifiedTimePickerDialog({
    required BuildContext context,
    required int sessionIndex,
    required int programId,
    required String timeType, // 'regular', 'from', 'to'
  }) async {
    // تحديد الوقت الأولي بناءً على النوع
    TimeOfDay? initialTime;
    switch (timeType) {
      case 'regular':
        initialTime = sessionIndex < selectedTimesOfDay.length
            ? selectedTimesOfDay[sessionIndex]
            : TimeOfDay.now();
        break;
      case 'from':
        initialTime = sessionIndex < selectedFromTimes.length
            ? selectedFromTimes[sessionIndex]
            : TimeOfDay.now();
        break;
      case 'to':
        initialTime = sessionIndex < selectedToTimes.length
            ? selectedToTimes[sessionIndex]
            : TimeOfDay.now();
        break;
      default:
        initialTime = TimeOfDay.now();
    }

    // التأكد من أن الدقائق إما 0 أو 30
    if (initialTime != null &&
        initialTime.minute != 0 &&
        initialTime.minute != 30) {
      // إذا كانت الدقائق غير 0 أو 30، اجعلها 0
      initialTime = TimeOfDay(hour: initialTime.hour, minute: 0);
    }

    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: Theme(
            data: Theme.of(context).copyWith(
              // تخصيص شكل الـ TimePicker إذا أردت
              timePickerTheme: const TimePickerThemeData(),
            ),
            child: child!,
          ),
        );
      },
    );

    if (picked != null) {
      // تقريب الوقت إلى أقرب نصف ساعة
      TimeOfDay correctedTime = _roundToNearestHalfHour(picked);

      // استدعاء الدالة المناسبة بناءً على النوع
      switch (timeType) {
        case 'regular':
          changeSelectedTime(correctedTime, sessionIndex, context, programId);
          break;
        case 'from':
          changeSelectedFromTime(
            context,
            correctedTime,
            sessionIndex,
            programId,
          );
          break;
        case 'to':
          changeSelectedToTime(context, correctedTime, sessionIndex, programId);
          break;
      }
    }
  }

  TimeOfDay _roundToNearestHalfHour(TimeOfDay time) {
    int minute = time.minute;
    int roundedMinute;

    if (minute <= 15) {
      roundedMinute = 0;
    } else if (minute <= 45) {
      roundedMinute = 30;
    } else {
      // إذا كانت الدقائق أكبر من 45، انتقل للساعة التالية
      return TimeOfDay(hour: (time.hour + 1) % 24, minute: 0);
    }

    return TimeOfDay(hour: time.hour, minute: roundedMinute);
  }

  List<TextEditingController> specifyAllDayController = [];

  int selectedLecturerIndex = 0;

  changeLecturerIndex(int index) {
    selectedLecturerIndex = index;
    emit(ChangeLecturerIndexState());
  }

  final List<String> tabs = ["مواعيد ثابتة", 'مواعيد مرنة'];
  int selectedStudentIndex = 0;

  void incrementSelectedStudentIndex(BuildContext context) {
    log("${addedChildren?.length}");
    if (addedChildren != null &&
        selectedStudentIndex < addedChildren!.length - 1) {
      delightfulToast(
        message:
            "تم إضافة الطالب ${addedChildren?[selectedStudentIndex].firstName}",
        context: context,
      );
      selectedStudentIndex++;
    } else {
      Navigator.pushNamed(context, RoutePaths.layoutPath);
    }
    log("$selectedStudentIndex");
    emit(IncrementSelectedStudentndex());
  }

  List<bool> isDoneAdded = [];

  initIsDoneAdded() {
    log("inited");
    isDoneAdded = [];
    if (addedUsersIds.isNotEmpty) {
      isDoneAdded = List.filled(addedUsersIds.length, false);
    }
    log("l ${isDoneAdded.length}");
  }

  void changeIsDoneAdded(int index) {
    isDoneAdded[index] = true;
    emit(ChangeIsDoneAddedState());
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

  int tapbarIndex = 0;

  void changeTapbarIndex(int index) {
    tapbarIndex = index;
    emit(ChangeTapBarIndexState());
  }

  // List<bool> chosenDays = [];
  // int limit = 3;
  //
  // void changeChosenDays(int index) {
  //   chosenDays[index] = !chosenDays[index];
  //   emit(ChangeChosenDaysState());
  // }

  List<Widget> subTabbarBody({
    required BuildContext context,
    required int programId,
  }) {
    return [
      RepeatedWeeklySession(programId: programId),
      SpecifyAllSessionsDates(programId: programId),
    ];
  }

  //! TimePicker
  List<TimeOfDay?> selectedTimesOfDay = [];
  List<String> selectedTimes = [];

  // في الـ constructor أو في initState
  void initializeSessionTimes(int numberOfSessions) {
    selectedTimesOfDay = List.filled(numberOfSessions, null);
    selectedTimes = List.filled(numberOfSessions, "24 ساعة");
  }

  // إضافة هذه الدالة في الـ Cubit
  void checkAndCallAddWeeklyAppointments(
    BuildContext context,
    int programId,
  ) async {
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

    // إذا كانت جميع الـ sessions مكتملة، استدعي addWeeklyAppointments
    if (allSessionsComplete) {
      await addWeeklyAppointments(context);
      await getInstructors(context, programId);
    }
  }

  void changeSelectedTime(
    TimeOfDay timeOfDay,
    int sessionIndex,
    BuildContext context,
    int programId,
  ) {
    TimeOfDay correctedTime = _roundToNearestHalfHour(timeOfDay);

    selectedTimesOfDay[sessionIndex] = correctedTime;
    final hour = correctedTime.hourOfPeriod == 0
        ? 12
        : correctedTime.hourOfPeriod;
    final minute = correctedTime.minute.toString().padLeft(2, '0');
    final period = correctedTime.period == DayPeriod.am ? 'ص' : 'م';
    selectedTimes[sessionIndex] = '$hour:$minute $period';

    if (sessionIndex < hoursControllers.length) {
      hoursControllers[sessionIndex].text = selectedTimes[sessionIndex];
    }

    emit(ChangeSelectedTimeState());

    // فحص إذا كانت جميع الـ sessions مكتملة
    checkAndCallAddWeeklyAppointments(context, programId);
  }

  // تعديل دالة showTimePickerDialog لتأخذ index
  Future<void> showTimePickerDialog(
    BuildContext context,
    int sessionIndex,
    int programId,
  ) async {
    await showUnifiedTimePickerDialog(
      context: context,
      sessionIndex: sessionIndex,
      programId: programId,
      timeType: 'regular',
    );
  }

  String getTimeForServer(int sessionIndex) {
    if (sessionIndex < selectedTimesOfDay.length &&
        selectedTimesOfDay[sessionIndex] != null) {
      TimeOfDay correctedTime = _roundToNearestHalfHour(
        selectedTimesOfDay[sessionIndex]!,
      );
      final hour = correctedTime.hour.toString().padLeft(2, '0');
      final minute = correctedTime.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    }
    return '';
  }

  static GroupPackageManagementCubit get(context) => BlocProvider.of(context);

  int stepperIndex = 1;

  void incrementStepperIndex(BuildContext context, int programId) {
    if (stepperIndex < bodies(programId).length - 1) {
      stepperIndex++;
    } else {
      LayoutCubit.get(context).changeIndex(1);
      Navigator.pushNamedAndRemoveUntil(
        context,
        RoutePaths.layoutPath,
        (route) => false,
      );
    }
    emit(ChangeStepperIndexState());
  }

  void decrementStepperIndex(BuildContext context) {
    if (stepperIndex > 1) {
      stepperIndex--;
    } else {
      Navigator.pop(context);
    }
    emit(ChangeStepperIndexState());
  }

  List<Widget> bodies(int programId) {
    return [
      const SizedBox(),
      BlocProvider.value(
        value: sl<AddNewStudentDataToProgramCubit>(),
        child: ChosenStudentBody(programId: programId),
      ),
      ChosenLecturer(orderProgramId: programId),
    ];
  }

  bool addMyself = false;
  int? numberOfAllowed;
  int? numberOfAlreadySubscribed;
  int studentCounter = 0;

  bool checkCanAddToThisProgramValidation(BuildContext context) {
    numberOfAlreadySubscribed =
        getOrderDetailsEntity?.data?.numberOfSubscriptions ?? 0;
    numberOfAllowed = getOrderDetailsEntity?.data?.orderStudentNumber ?? 0;

    int totalStudents = numberOfAlreadySubscribed! + studentCounter;

    log(
      "allowed count is $numberOfAllowed already count is $numberOfAlreadySubscribed static counter is $studentCounter total will be $totalStudents",
    );

    if (totalStudents >= numberOfAllowed!) {
      delightfulToast(
        message:
            "لقد وصلت الي الحد الاقصي لعدد الطلاب المسموح به في هذا البرنامج",
        context: context,
      );
      return false;
    }
    return true;
  }

  void toggleMyself(BuildContext context) {
    if (!addMyself) {
      if (!checkCanAddToThisProgramValidation(context)) {
        return;
      }
    }

    log("$studentCounter");
    addMyself = !addMyself;

    if (addMyself && !addedUsersIds.contains(loginData?.id)) {
      studentCounter++;
      addedUsersIds.add(loginData?.id ?? -1);
    } else if (!addMyself && addedUsersIds.contains(loginData?.id)) {
      studentCounter--;
      addedUsersIds.remove(loginData?.id ?? -1);
    }
    log("user id $addedUsersIds");
    emit(ToggleAddMySelfState());
  }

  void changeChosen(int index, BuildContext context) {
    if (index >= 0 && index < chosen.length) {
      if (!chosen[index]) {
        if (!checkCanAddToThisProgramValidation(context)) {
          return;
        }
      }

      chosen[index] = !chosen[index];

      if (chosen[index]) {
        studentCounter++;
        if (!addedUsersIds.contains(
          getMyChildrenEntity?.data?[index].id ?? -1,
        )) {
          addedUsersIds.add(getMyChildrenEntity?.data?[index].id ?? -1);
        }
      } else {
        studentCounter--;
        addedUsersIds.remove(getMyChildrenEntity?.data?[index].id ?? -1);
      }

      log("ids {$addedUsersIds}");
      emit(ChangeChosenState());
    }
  }

  List<bool> chosen = [];

  bool getMyChildrenLoader = false;
  GetMyChildrenEntity? getMyChildrenEntity;
  GetChildrenUsecase getChildrenUsecase;

  Future<void> getMyChildren() async {
    getMyChildrenLoader = true;
    emit(GetMyChildrenLoadingState());
    final result = await getChildrenUsecase.call(
      parameter: GetMyChildernParameters(childernsStatus: true),
    );
    result.fold(
      (l) {
        getMyChildrenLoader = false;
        emit(GetMyChildrenErrorState(errorMessage: l.message));
      },
      (r) {
        getMyChildrenLoader = false;
        getMyChildrenEntity = r;
        initIsChosen();
        emit(GetMyChildrenSuccessState());
      },
    );
  }

  void initIsChosen() {
    if (getMyChildrenEntity?.data != null) {
      chosen = List.filled(getMyChildrenEntity!.data!.length, false);
    }
  }

  List<int> addedUsersIds = [];

  List<MyChildEntity>? addedChildren = [];

  void fillAddedChildrenData() {
    addedChildren = [];
    for (var id in addedUsersIds) {
      addedChildren?.addAll(
        getMyChildrenEntity?.data
                ?.where((element) => element.id == id)
                .toList() ??
            [],
      );
    }
    if (addedUsersIds.contains(loginData?.id)) {
      addedChildren?.add(
        MyChildEntity(
          firstName: loginData?.firstName,
          lastName: loginData?.lastName,
          image: loginData?.image,
          id: loginData?.id,
        ),
      );
    }
    initIsDoneAdded();
    log("$addedChildren");
  }

  // Variables
  bool getMyOrdersLoader = false;
  bool addWeeklyAppointmentsLoader = false;
  bool createMeetingSessionsLoader = false;
  GetOrderDetailsEntity? getOrderDetailsEntity;
  CreateMeetingSessionsEntity? createMeetingSessionsEntity;
  AddWeeklyAppontmentsEntity? addWeeklyAppontmentsEntity;
  GetOrderDetailsUsecase getOrderDetailsUsecase;
  CreateMeetingSessionsUsecase createMeetingSessionsUsecase;
  AddWeeklyAppointmentsUsecase addWeeklyAppointmentsUsecase;

  Future<void> getOrderDetails({required int orderId}) async {
    getMyOrdersLoader = true;
    emit(GetMyOrdersLoadingState());

    final result = await getOrderDetailsUsecase.call(
      parameter: GetOrderDetailsPaameters(orderId: orderId),
    );

    result.fold(
      (failure) {
        getMyOrdersLoader = false;
        emit(GetMyOrdersErrorState(failure.message));
      },
      (data) {
        getMyOrdersLoader = false;
        getOrderDetailsEntity = data;

        int numberOfSessionsPerWeek =
            int.tryParse(
              getOrderDetailsEntity?.data?.numberOfSessionPerWeek ?? "0",
            ) ??
            0;
        int numberOfSessions =
            getOrderDetailsEntity?.data?.numberOfSessions ?? 0;

        for (var controller in dayController) {
          controller.dispose();
        }
        for (var controller in specifyAllDayController) {
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

        dayController.clear();
        specifyAllDayController.clear();
        hoursControllers.clear();
        fromControllers.clear();
        toControllers.clear();

        for (int i = 0; i < numberOfSessionsPerWeek; i++) {
          dayController.add(TextEditingController());
          hoursControllers.add(TextEditingController());
        }
        for (int i = 0; i < numberOfSessions; i++) {
          specifyAllDayController.add(TextEditingController());
          fromControllers.add(TextEditingController());
          toControllers.add(TextEditingController());
        }

        initializeSessionTimes(numberOfSessionsPerWeek);
        initializeFromTimes(numberOfSessions);
        initializeToTimes(numberOfSessions);
        emit(GetMyOrdersSuccessState());
      },
    );
  }

  // تعديل في method addWeeklyAppointments() لاستخدام الوقت المختار

  // تعديل دالة addWeeklyAppointments لإرسال كل يوم مع وقته
  Future<void> addWeeklyAppointments(BuildContext context) async {
    addWeeklyAppointmentsLoader = true;
    emit(AddWeeklyAppointmentsLoadingState());

    // إنشاء appointments map بناء على الأيام المختارة والأوقات المختارة
    Map<String, String> appointmentsMap = {};

    // التكرار على كل session وإضافة اليوم مع وقته
    for (int i = 0; i < dayController.length; i++) {
      String dayText = dayController[i].text;
      String serverTime = getTimeForServer(i);

      if (dayText.isNotEmpty && serverTime.isNotEmpty) {
        // تحويل اسم اليوم العربي إلى إنجليزي
        String dayInEnglish = WeekDaysEnum.values
            .firstWhere((element) => element.title == dayController[i].text)
            .requestValue;
        if (dayInEnglish.isNotEmpty) {
          appointmentsMap[dayInEnglish.toLowerCase()] = serverTime;
        }
      }
    }

    final result = await addWeeklyAppointmentsUsecase.call(
      parameter: AddWeeklyAppointmentsParameters(
        data: AddWeeklyAppointmentsTojson(
          startDate: DateTime.now().toString(),
          userId: addedUsersIds[selectedStudentIndex],
          duration:
              int.tryParse(getOrderDetailsEntity?.data?.duration ?? "-1") ?? -1,
          subscripeDays:
              int.tryParse(
                getOrderDetailsEntity?.data?.subscripeDays ?? "-1",
              ) ??
              -1,
          numberOfSessions: getOrderDetailsEntity?.data?.numberOfSessions ?? -1,
          appointments: appointmentsMap,
        ),
      ),
    );

    result.fold(
      (failure) {
        addWeeklyAppointmentsLoader = false;
        emit(AddWeeklyAppointmentsErrorState(failure.message));
        // delightfulToast(message: failure.message, context: context);
      },
      (data) {
        addWeeklyAppointmentsLoader = false;
        addWeeklyAppontmentsEntity = data;
        if (data.status != 200) {
          delightfulToast(message: data.message ?? "", context: context);
        }
        emit(AddWeeklyAppointmentsSuccessState());
      },
    );
  }

  bool getProgramContentLoader = false;
  GetProgramContentEntity? getProgramContentEntity;
  GetProgramContentUsecase getProgramContentUsecase;

  Future<void> getProgramContent({required int programId}) async {
    getProgramContentLoader = true;
    emit(GetProgramContentLoadingState());

    final result = await getProgramContentUsecase.call(
      parameter: GetProgramContentParameters(programId: programId),
    );

    result.fold(
      (failure) {
        getProgramContentLoader = false;
        emit(GetProgramContentErrorState(errorMessage: failure.message));
      },
      (data) {
        getProgramContentLoader = false;
        getProgramContentEntity = data;
        emit(GetProgramContentSuccessState());
      },
    );
  }

  int programContentId = -1;

  onGoalChanged(int val) {
    programContentId = val;
    log("this is p c id $programContentId");
  }

  List<AddWeeklyAppontmentsDatumEntity> specifiedDates = [];

  // دالة للتحقق من اكتمال جميع المواعيد المحددة
  void checkAndCallSpecifyAllDatesAppointments(
    BuildContext context,
    int programId,
  ) async {
    // التحقق من أن جميع الـ sessions لها أيام وأوقات محددة (from & to)
    bool allSessionsComplete = true;
    int numberOfSessions = getOrderDetailsEntity?.data?.numberOfSessions ?? 0;

    for (int i = 0; i < numberOfSessions; i++) {
      // التحقق من وجود اليوم
      if (i >= specifyAllDayController.length ||
          specifyAllDayController[i].text.isEmpty) {
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

    // إذا كانت جميع الـ sessions مكتملة، استدعي specifyAllDatesAppointments
    if (allSessionsComplete && numberOfSessions > 0) {
      specifyAllDatesAppointments();
      await getInstructors(context, programId);
      log("All sessions completed - specifyAllDatesAppointments called");
    }
  }

  // تعديل دالة changeSpecifiedAllDay لتشمل الفحص التلقائي
  changeSpecifiedAllDay(
    BuildContext context,
    String day,
    int sessionIndex,
    int programId,
  ) {
    if (sessionIndex < specifyAllDayController.length) {
      specifyAllDayController[sessionIndex].text = day;
      emit(ChangeSpecifiedDayState());

      // فحص إذا كانت جميع الـ sessions مكتملة
      checkAndCallSpecifyAllDatesAppointments(context, programId);
    }
  }

  // تعديل دالة changeSelectedFromTime لتشمل الفحص التلقائي
  void changeSelectedFromTime(
    BuildContext context,
    TimeOfDay timeOfDay,
    int sessionIndex,
    int programId,
  ) {
    // التأكد من أن الوقت ساعة صحيحة أو نصف ساعة
    TimeOfDay correctedTime = _roundToNearestHalfHour(timeOfDay);

    selectedFromTimes[sessionIndex] = correctedTime;
    final hour = correctedTime.hourOfPeriod == 0
        ? 12
        : correctedTime.hourOfPeriod;
    final minute = correctedTime.minute.toString().padLeft(2, '0');
    final period = correctedTime.period == DayPeriod.am ? 'ص' : 'م';
    selectedFromTimesDisplay[sessionIndex] = '$hour:$minute $period';

    // تحديث الـ controller الخاص بالـ session
    if (sessionIndex < fromControllers.length) {
      fromControllers[sessionIndex].text =
          selectedFromTimesDisplay[sessionIndex];
    }

    emit(ChangeSelectedFromTimeState());

    // فحص إذا كانت جميع الـ sessions مكتملة
    checkAndCallSpecifyAllDatesAppointments(context, programId);
  }

  // تعديل دالة changeSelectedToTime لتشمل الفحص التلقائي
  void changeSelectedToTime(
    BuildContext context,
    TimeOfDay timeOfDay,
    int sessionIndex,
    int programId,
  ) {
    // التأكد من أن الوقت ساعة صحيحة أو نصف ساعة
    TimeOfDay correctedTime = _roundToNearestHalfHour(timeOfDay);

    selectedToTimes[sessionIndex] = correctedTime;
    final hour = correctedTime.hourOfPeriod == 0
        ? 12
        : correctedTime.hourOfPeriod;
    final minute = correctedTime.minute.toString().padLeft(2, '0');
    final period = correctedTime.period == DayPeriod.am ? 'ص' : 'م';
    selectedToTimesDisplay[sessionIndex] = '$hour:$minute $period';

    // تحديث الـ controller الخاص بالـ session
    if (sessionIndex < toControllers.length) {
      toControllers[sessionIndex].text = selectedToTimesDisplay[sessionIndex];
    }

    emit(ChangeSelectedToTimeState());

    // فحص إذا كانت جميع الـ sessions مكتملة
    checkAndCallSpecifyAllDatesAppointments(context, programId);
  }

  // تعديل دالة specifyAllDatesAppointments لملء الليستة بشكل صحيح
  void specifyAllDatesAppointments() {
    specifiedDates.clear(); // مسح البيانات السابقة

    int numberOfSessions = getOrderDetailsEntity?.data?.numberOfSessions ?? 0;

    for (int i = 0; i < numberOfSessions; i++) {
      if (i < specifyAllDayController.length &&
          i < selectedFromTimes.length &&
          i < selectedToTimes.length &&
          specifyAllDayController[i].text.isNotEmpty &&
          selectedFromTimes[i] != null &&
          selectedToTimes[i] != null) {
        // الحصول على اليوم المختار
        String selectedDay = specifyAllDayController[i].text;

        // الحصول على التاريخ الحالي
        DateTime now = DateTime.now();

        // البحث عن أقرب يوم مطابق في الأسبوع
        int selectedDayIndex = WeekDaysEnum.values.indexWhere(
          (day) => day.title == selectedDay,
        );

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
            AddWeeklyAppontmentsDatumEntity(
              start: startDateTime,
              end: endDateTime,
            ),
          );
        }
      }
    }

    log("Specified dates filled: ${specifiedDates.length} appointments");
    log(
      "Specified dates content: ${specifiedDates.map((e) => '${e.start} - ${e.end}').toList()}",
    );
  }

  Future<void> createMeetingSessions(BuildContext context) async {
    createMeetingSessionsLoader = true;
    log("started");
    log("addedUsersIds: $addedUsersIds");
    log("selectedStudentIndex: $selectedStudentIndex");
    log("addedUsersIds.length: ${addedUsersIds.length}");

    if (addedUsersIds.isEmpty) {
      log("Error: addedUsersIds is empty");
      createMeetingSessionsLoader = false;
      emit(CreateMeetingSessionsErrorState("لا توجد مستخدمين مضافين"));
      return;
    }

    if (selectedStudentIndex < 0 ||
        selectedStudentIndex >= addedUsersIds.length) {
      log(
        "Error: selectedStudentIndex ($selectedStudentIndex) is out of range (0-${addedUsersIds.length - 1})",
      );
      createMeetingSessionsLoader = false;
      emit(CreateMeetingSessionsErrorState("فهرس الطالب غير صحيح"));
      return;
    }
    if (programContentId == -1) {
      createMeetingSessionsLoader = false;
      delightfulToast(message: "اختر الهدف", context: context);
      emit(CreateMeetingSessionsErrorState("لم يتم اختيار الهدف"));
      return;
    }

    int userId = addedUsersIds[selectedStudentIndex];
    if (userId == -1) {
      log("Error: Invalid userId: $userId");
      createMeetingSessionsLoader = false;
      emit(CreateMeetingSessionsErrorState("معرف المستخدم غير صحيح"));
      return;
    }

    log("Valid userId: $userId");
    log("programContentId: $programContentId");

    emit(CreateMeetingSessionsLoadingState());

    int instructorId =
        getInstructorsEntity?.data?[selectedLecturerIndex].id ?? 0;
    int programId =
        int.tryParse(getOrderDetailsEntity?.data?.programIds?.first ?? "0") ??
        0;

    final result = await createMeetingSessionsUsecase.call(
      parameter: CreateMeetingSessionsParameters(
        data: CreateMeetingSessionsTojson(
          appointments: addWeeklyAppontmentsEntity?.data ?? specifiedDates,
          instructorId: instructorId,
          duration:
              int.tryParse(
                getOrderDetailsEntity?.data?.duration?.toString() ?? "0",
              ) ??
              0,
          programContentId: programContentId,
          programId: programId,
          userId: userId, // استخدام المتغير المتحقق منه
        ),
      ),
    );

    result.fold(
      (failure) {
        log("failed: ${failure.message}");
        createMeetingSessionsLoader = false;
        delightfulToast(message: failure.message, context: context);
        emit(CreateMeetingSessionsErrorState(failure.message));
      },
      (data) async {
        log("success");
        if (isDoneAdded.length > selectedStudentIndex) {
          changeIsDoneAdded(selectedStudentIndex);
          log(
            "isDoneAdded[$selectedStudentIndex] = ${isDoneAdded[selectedStudentIndex]}",
          );
        } else {
          log(
            "Warning: isDoneAdded length (${isDoneAdded.length}) is less than selectedStudentIndex ($selectedStudentIndex)",
          );
        }

        incrementSelectedStudentIndex(context);
        // clearData();
        String dayToServer = "";
        for (var day in dayController) {
          dayToServer = WeekDaysEnum.values
              .firstWhere((element) => element.title == day.text)
              .requestValue;
        }
        log("day to server is $dayToServer");
        final times = addWeeklyAppontmentsEntity?.data
            ?.map(
              (e) => Times(
                day: dayToServer,
                from: DateFormat("H:mm:ss").format(e.start!).toString(),
                to: DateFormat("H:mm:ss").format(e.end!).toString(),
              ),
            )
            .toList();
        await addUserSessionDateAndTime(
          instructorId: instructorId,
          programId: programId,
          times: times!,
        );
        createMeetingSessionsLoader = false;
        emit(CreateMeetingSessionsSuccessState());
      },
    );
    createMeetingSessionsLoader = false;
  }

  bool getInstructorsLoader = false;
  GetInstructorsEntity? getInstructorsEntity;
  GetInstructorsUsecase getInstructorsUsecase;

  List<TextEditingController> hoursControllers = [];
  List<TextEditingController> fromControllers = [];
  List<TextEditingController> toControllers = [];

  Future<void> getInstructors(BuildContext context, int programId) async {
    getInstructorsLoader = true;
    emit(GetInstructorsLoadingState());
    log(
      "list length ${addWeeklyAppontmentsEntity?.data?.length ?? specifiedDates.length}",
    );
    log("pid is $programId");

    final result = await getInstructorsUsecase.call(
      parameter: GetInstructorsParameters(
        data: GetInstructorsTojson(
          appointments: addWeeklyAppontmentsEntity?.data ?? specifiedDates,
          programId: programId,
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

  // دوال للتعامل مع fromControllers
  List<TimeOfDay?> selectedFromTimes = [];
  List<String> selectedFromTimesDisplay = [];

  void initializeFromTimes(int numberOfSessions) {
    selectedFromTimes = List.filled(numberOfSessions, null);
    selectedFromTimesDisplay = List.filled(numberOfSessions, "24 ساعة");
  }

  Future<void> showFromTimePickerDialog(
    BuildContext context,
    int sessionIndex,
    int programId,
  ) async {
    await showUnifiedTimePickerDialog(
      context: context,
      sessionIndex: sessionIndex,
      programId: programId,
      timeType: 'from',
    );
  }

  String getFromTimeForServer(int sessionIndex) {
    if (sessionIndex < selectedFromTimes.length &&
        selectedFromTimes[sessionIndex] != null) {
      TimeOfDay correctedTime = _roundToNearestHalfHour(
        selectedFromTimes[sessionIndex]!,
      );
      final hour = correctedTime.hour.toString().padLeft(2, '0');
      final minute = correctedTime.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    }
    return '';
  }

  // دوال للتعامل مع toControllers
  List<TimeOfDay?> selectedToTimes = [];
  List<String> selectedToTimesDisplay = [];

  void initializeToTimes(int numberOfSessions) {
    selectedToTimes = List.filled(numberOfSessions, null);
    selectedToTimesDisplay = List.filled(numberOfSessions, "24 ساعة");
  }

  Future<void> showToTimePickerDialog(
    BuildContext context,
    int sessionIndex,
    int programId,
  ) async {
    await showUnifiedTimePickerDialog(
      context: context,
      sessionIndex: sessionIndex,
      programId: programId,
      timeType: 'to',
    );
  }

  String getToTimeForServer(int sessionIndex) {
    if (sessionIndex < selectedToTimes.length &&
        selectedToTimes[sessionIndex] != null) {
      TimeOfDay correctedTime = _roundToNearestHalfHour(
        selectedToTimes[sessionIndex]!,
      );
      final hour = correctedTime.hour.toString().padLeft(2, '0');
      final minute = correctedTime.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    }
    return '';
  }

  void clearData() {
    // مسح hoursControllers إذا لم تكن فارغة
    if (hoursControllers != null && hoursControllers.isNotEmpty) {
      for (var controller in hoursControllers) {
        if (controller.text.isNotEmpty) {
          controller.clear();
        }
      }
    }

    // مسح fromControllers إذا لم تكن فارغة
    if (fromControllers != null && fromControllers.isNotEmpty) {
      for (var controller in fromControllers) {
        if (controller.text.isNotEmpty) {
          controller.clear();
        }
      }
    }

    // مسح toControllers إذا لم تكن فارغة
    if (toControllers != null && toControllers.isNotEmpty) {
      for (var controller in toControllers) {
        if (controller.text.isNotEmpty) {
          controller.clear();
        }
      }
    }

    // مسح dayController إذا لم تكن فارغة
    if (dayController != null && dayController.isNotEmpty) {
      for (var controller in dayController) {
        if (controller.text.isNotEmpty) {
          controller.clear();
        }
      }
    }

    // مسح specifyAlldayController إذا لم تكن فارغة
    if (specifyAllDayController != null && specifyAllDayController.isNotEmpty) {
      for (var controller in specifyAllDayController) {
        if (controller.text.isNotEmpty) {
          controller.clear();
        }
      }
    }

    // مسح الأوقات المحفوظة إذا لم تكن فارغة
    if (selectedFromTimes != null && selectedFromTimes.isNotEmpty) {
      selectedFromTimes.clear();
    }

    if (selectedFromTimesDisplay != null &&
        selectedFromTimesDisplay.isNotEmpty) {
      selectedFromTimesDisplay.clear();
    }

    if (selectedToTimes != null && selectedToTimes.isNotEmpty) {
      selectedToTimes.clear();
    }

    if (selectedToTimesDisplay != null && selectedToTimesDisplay.isNotEmpty) {
      selectedToTimesDisplay.clear();
    }
  }

  @override
  Future<void> close() {
    addedChildren = [];
    addMyself = false;

    // dispose dayControllers
    for (var controller in dayController) {
      controller.dispose();
    }
    dayController.clear();

    for (var controller in specifyAllDayController) {
      controller.dispose();
    }
    specifyAllDayController.clear();

    // dispose hoursControllers
    for (var controller in hoursControllers) {
      controller.dispose();
    }
    hoursControllers.clear();

    // dispose fromControllers
    for (var controller in fromControllers) {
      controller.dispose();
    }
    fromControllers.clear();

    // dispose toControllers
    for (var controller in toControllers) {
      controller.dispose();
    }
    toControllers.clear();
    controller?.dispose();
    return super.close();
  }

  int orderId = -1;

  GlobalKey<FormState> repeatedFormKey = GlobalKey<FormState>();

  void fillOrderId(int val) {
    orderId = val;
  }

  RequestToFindInstructorUsecase requestToFindInstructorUsecase;
  RequestToFindInstructorEntity? requestToFindInstructorEntity;
  bool requestTofindInstructorLoader = false;

  Future<void> findInstructor({
    required BuildContext context,
    required String programId,
  }) async {
    requestTofindInstructorLoader = true;
    List<AddWeeklyAppontmentsDatumEntity> currentSessions = [];

    currentSessions = addWeeklyAppontmentsEntity?.data ?? specifiedDates;

    List<GetRemainigProgramSessionsDatumEntity> sessionsToSend = [];
    currentSessions.map((e) {
      sessionsToSend.add(
        GetRemainigProgramSessionsDatumEntity(end: e.end, start: e.start),
      );
      sessionsToSend;
    }).toList();
    if (sessionsToSend.isEmpty) {
      requestTofindInstructorLoader = false;
      emit(
        FindInstructorErrorState(
          errorMessage: "لا توجد مواعيد محددة لتغيير المحاضر",
        ),
      );
      delightfulToast(
        message: "لا يوجد مواعيد محددة لتغيير المحاضر",
        context: context,
      );
      return;
    }
    emit(FindInstructorLoadingState());
    final result = await requestToFindInstructorUsecase.call(
      parameter: RequestToFindInstructorParameters(
        data: RequestToFindInstructorTojson(
          sessions: sessionsToSend,
          userId: addedUsersIds[selectedStudentIndex].toString(),
          contentId: programContentId.toString(),
          programId: programId,
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
        // التحقق من صحة isDoneAdded قبل الوصول إليها
        if (isDoneAdded.length > selectedStudentIndex) {
          changeIsDoneAdded(selectedStudentIndex);
          log(
            "isDoneAdded[$selectedStudentIndex] = ${isDoneAdded[selectedStudentIndex]}",
          );
        } else {
          log(
            "Warning: isDoneAdded length (${isDoneAdded.length}) is less than selectedStudentIndex ($selectedStudentIndex)",
          );
        }
        incrementSelectedStudentIndex(context);
        // Navigator.pushNamed(
        //   context,
        //   RoutePaths.lectureView,
        //   arguments: {
        //     "programId": context.read<LectureCubit>().currentProgramId
        //   },
        // );
      },
    );
  }

  AddUserSessionDateAndTimeUseCase addUserSessionDateAndTimeUseCase;
  AddUserSessionDateAndTimeEntity? addUserSessionDateAndTimeEntity;
  bool addUserSessionDateAndTimeLoader = false;

  Future<void> addUserSessionDateAndTime({
    required int instructorId,
    required int programId,
    required List<Times> times,
  }) async {
    addUserSessionDateAndTimeLoader = false;
    emit(AddUserSessionDateAndTimeLoadingState());
    final result = await addUserSessionDateAndTimeUseCase.call(
      parameter: AddUserSessionDateAndTimeParameters(
        data: AddUserSessionDateAndTimeToJson(
          instructorId: instructorId,
          programId: programId,
          times: times,
        ),
      ),
    );

    result.fold(
      (l) {
        addUserSessionDateAndTimeLoader = false;
        emit(AddUserSessionDateAndTimeErrorState(errorMessage: l.message));
      },
      (r) {
        addUserSessionDateAndTimeEntity = r;
        emit(AddUserSessionDateAndTimeSuccessState());
      },
    );
  }
}
