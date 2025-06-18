import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/core/component/spline_area_chart.dart';
import 'package:eazifly_student/core/component/stats_area.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_assignments_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/show_program_details_entity.dart';
import 'package:eazifly_student/domain/use_cases/get_program_assignments_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_program_details_usecase.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/deliveries_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/exam_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/notes_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/report_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/schedules_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit({
    required this.showProgramDetailsUsecase,
    required this.getProgramSessionsUsecase,
    required this.getProgramAssignmentsUsecase,
  }) : super(LectureInitial()) {
    var loginData = DataModel.fromJson(
        jsonDecode(GetStorage().read(StorageEnum.loginModel.name)));
    userId = loginData.id ?? -1;
    log("$userId");
  }

  static LectureCubit get(context) => BlocProvider.of(context);
  late TabController controller;
  int userId = -1;
  int currentProgramId = -1;

  // حالات التحميل لكل tab
  Map<int, bool> tabLoadingStates = {
    0: false, // المواعيد
    1: false, // الإحصائيات
    2: false, // الإمتحانات
    3: false, // التسليمات
    4: false, // التقارير
    5: false, // الملاحظات
  };

  // بيانات كل tab
  Map<int, dynamic> tabData = {
    0: null, // بيانات المواعيد
    1: null, // بيانات الإحصائيات
    2: null, // بيانات الإمتحانات
    3: null, // بيانات التسليمات
    4: null, // بيانات التقارير
    5: null, // بيانات الملاحظات
  };

  void initController(TickerProvider vsync, int programId) {
    currentProgramId = programId;
    controller = TabController(length: tabs.length, vsync: vsync)
      ..addListener(() {
        if (controller.indexIsChanging) {
          int newIndex = controller.index;
          _handleTabChange(newIndex);
        }
      });

    // تحميل بيانات Tab الأول (المواعيد) مباشرة
    _handleTabChange(0);
  }

  void _handleTabChange(int tabIndex) {
    switch (tabIndex) {
      case 0: // المواعيد
        if (tabData[0] == null) {
          getProgramSessions(programId: currentProgramId, userId: userId);
        }
        break;
      case 1: // الإحصائيات
        if (tabData[1] == null) {
          _loadStatisticsData();
        }
        break;
      case 2: // الإمتحانات
        if (tabData[2] == null) {
          _loadExamsData();
        }
        break;
      case 3: // التسليمات
        if (tabData[3] == null) {
          getProgramAssignments(
            programId: currentProgramId,
            userId: userId,
          );
        }
        break;
      case 4: // التقارير
        if (tabData[4] == null) {
          _loadReportsData();
        }
        break;
      case 5: // الملاحظات
        if (tabData[5] == null) {
          _loadNotesData();
        }
        break;
    }
    emit(TabIndexState());
  }

  // دالة للحصول على حالة التحميل للـ tab الحالي
  bool get isCurrentTabLoading => tabLoadingStates[controller.index] ?? false;

  // دالة للحصول على بيانات الـ tab الحالي
  dynamic get currentTabData => tabData[controller.index];

  List<Widget> get screens => [
        _buildSchedulesBody(),
        _buildStatsBody(),
        _buildExamBody(),
        _buildDeliveriesBody(),
        _buildReportBody(),
        _buildNotesBody(),
      ];

  // بناء محتوى كل tab مع إدارة حالة التحميل
  Widget _buildSchedulesBody() {
    if (tabLoadingStates[0] == true) {
      return const Center(child: CircularProgressIndicator());
    }
    return const SchedulesBody();
  }

  Widget _buildStatsBody() {
    if (tabLoadingStates[1] == true) {
      return const Center(child: CircularProgressIndicator());
    }
    return StatsArea(
      chartData: chartData,
      gradientColors: gradientColors,
    );
  }

  Widget _buildExamBody() {
    if (tabLoadingStates[2] == true) {
      return const Center(child: CircularProgressIndicator());
    }
    return const ExamBodyWidget();
  }

  Widget _buildDeliveriesBody() {
    if (tabLoadingStates[3] == true) {
      return const Center(child: CircularProgressIndicator());
    }
    return const DeliveriesBodyWidget();
  }

  Widget _buildReportBody() {
    if (tabLoadingStates[4] == true) {
      return const Center(child: CircularProgressIndicator());
    }
    return const ReportBody();
  }

  Widget _buildNotesBody() {
    if (tabLoadingStates[5] == true) {
      return const Center(child: CircularProgressIndicator());
    }
    return const NotesBodyWidget();
  }

  var tabs = [
    "المواعيد",
    "الإحصائيات",
    "الإمتحانات",
    "التسليمات",
    "التقارير",
    "الملاحظات",
  ];

  // بيانات التطبيق الحالية
  bool showProgramDetailsLoader = false;
  ShowProgramDetailsEntity? showProgramDetailsEntity;
  ShowProgramDetailsUsecase showProgramDetailsUsecase;

  Future<void> showProgramDetails({required int programId}) async {
    showProgramDetailsLoader = true;
    emit(ShowProgramDetailsLoadingState());

    final result = await showProgramDetailsUsecase.call(
      parameter: ShowProgramDetailsParameters(programId: programId),
    );

    result.fold(
      (failure) {
        showProgramDetailsLoader = false;
        emit(ShowProgramDetailsErrorState(errorMessage: failure.message));
      },
      (data) {
        showProgramDetailsLoader = false;
        showProgramDetailsEntity = data;
        emit(ShowProgramDetailsSuccessState());
      },
    );
  }

  // بيانات المواعيد
  bool getProgramSessionsLoader = false;
  GetProgramSessionsEntity? getProgramSessionsEntity;
  GetProgramSessionsUsecase getProgramSessionsUsecase;

  Future<void> getProgramSessions({
    required int programId,
    required int userId,
  }) async {
    tabLoadingStates[0] = true;
    getProgramSessionsLoader = true;
    emit(GetProgramSessionsLoadingState());

    final result = await getProgramSessionsUsecase.call(
      parameter: GetProgramSessionParameters(
        programId: programId,
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        tabLoadingStates[0] = false;
        getProgramSessionsLoader = false;
        emit(GetProgramSessionsErrorState(errorMessage: failure.message));
      },
      (data) {
        tabLoadingStates[0] = false;
        getProgramSessionsLoader = false;
        getProgramSessionsEntity = data;
        tabData[0] = data; // حفظ البيانات
        emit(GetProgramSessionsSuccessState());
      },
    );
  }

  bool getProgramAssignmentsLoader = false;
  GetProgramAssignmentsEntity? getProgramAssignmentsEntity;
  GetProgramAssignmentsUsecase getProgramAssignmentsUsecase;

  Future<void> getProgramAssignments({
    required int programId,
    required int userId,
  }) async {
    tabLoadingStates[3] = true;
    getProgramAssignmentsLoader = true;
    emit(GetProgramAssignmentsLoadingState());

    final result = await getProgramAssignmentsUsecase.call(
      parameter: GetProgramAssignmentsParameters(
        programId: programId,
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        tabLoadingStates[3] = false;
        getProgramAssignmentsLoader = false;
        emit(GetProgramAssignmentsErrorState(errorMessage: failure.message));
      },
      (data) {
        tabLoadingStates[3] = false;
        getProgramAssignmentsLoader = false;
        getProgramAssignmentsEntity = data;
        tabData[3] = data;
        emit(GetProgramAssignmentsSuccessState());
      },
    );
  }

  // دوال تحميل البيانات للـ tabs الأخرى
  Future<void> _loadStatisticsData() async {
    tabLoadingStates[1] = true;
    emit(TabIndexState());

    try {
      // هنا ضع كود تحميل بيانات الإحصائيات
      await Future.delayed(const Duration(seconds: 2)); // محاكاة API call

      // مثال على البيانات
      tabData[1] = "statistics_data";

      tabLoadingStates[1] = false;
      emit(StatisticsLoadedState());
    } catch (e) {
      tabLoadingStates[1] = false;
      emit(StatisticsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _loadExamsData() async {
    tabLoadingStates[2] = true;
    emit(TabIndexState());

    try {
      // هنا ضع كود تحميل بيانات الإمتحانات
      await Future.delayed(const Duration(seconds: 2)); // محاكاة API call

      tabData[2] = "exams_data";

      tabLoadingStates[2] = false;
      emit(ExamsLoadedState());
    } catch (e) {
      tabLoadingStates[2] = false;
      emit(ExamsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _loadReportsData() async {
    tabLoadingStates[4] = true;
    emit(TabIndexState());

    try {
      // هنا ضع كود تحميل بيانات التقارير
      await Future.delayed(const Duration(seconds: 2)); // محاكاة API call

      tabData[4] = "reports_data";

      tabLoadingStates[4] = false;
      emit(ReportsLoadedState());
    } catch (e) {
      tabLoadingStates[4] = false;
      emit(ReportsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _loadNotesData() async {
    tabLoadingStates[5] = true;
    emit(TabIndexState());

    try {
      // هنا ضع كود تحميل بيانات الملاحظات
      await Future.delayed(const Duration(seconds: 2)); // محاكاة API call

      tabData[5] = "notes_data";

      tabLoadingStates[5] = false;
      emit(NotesLoadedState());
    } catch (e) {
      tabLoadingStates[5] = false;
      emit(NotesErrorState(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
