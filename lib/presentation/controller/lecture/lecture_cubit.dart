import 'dart:convert';
import 'dart:developer';

import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/core/component/spline_area_chart.dart';
import 'package:eazifly_student/core/component/stats_area.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/complete_chapter_lesson_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_chapter_lessons_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_content_chapter.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assignment_details_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_assignments_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_user_feedbacks_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_user_reports_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/get_user_quizzes_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/show_program_details_entity.dart';
import 'package:eazifly_student/domain/use_cases/complete_chapter_lesson_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_assignment_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_chapter_lessons_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_content_chapter_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_assignments_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_feedback_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_quizzes_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_reports_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_program_details_usecase.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/deliveries_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/exam_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/notes_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/report_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/schedules_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class LectureCubit extends Cubit<LectureState> {
  LectureCubit({
    required this.showProgramDetailsUsecase,
    required this.getProgramSessionsUsecase,
    required this.getProgramAssignmentsUsecase,
    required this.getUserReportsUsecase,
    required this.getUserFeedbacksUsecase,
    required this.getChapterLessonsUsecase,
    required this.getContentChaptersUsecase,
    required this.completeChapterLessonUsecase,
    required this.getUserQuizzesUsecase,
    required this.getAssignmentDetailsUsecase,
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

  // حالات الأخطاء لكل tab
  Map<int, String?> tabErrorStates = {
    0: null,
    1: null,
    2: null,
    3: null,
    4: null,
    5: null,
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

  // تحديث هذه الدالة لاستدعاء البيانات في كل مرة
  void _handleTabChange(int tabIndex) {
    // مسح الأخطاء السابقة للتاب الحالي
    tabErrorStates[tabIndex] = null;

    // استدعاء البيانات دائماً عند الضغط على التاب
    switch (tabIndex) {
      case 0: // المواعيد
        getProgramSessions(
          programId: currentProgramId,
          userId: userId,
        );
        break;
      case 1: // الإحصائيات
        _loadStatisticsData();
        break;
      case 2: // الإمتحانات
        getUserQuizzes(programId: currentProgramId);
        break;
      case 3: // التسليمات
        getProgramAssignments(programId: currentProgramId, userId: userId);
        break;
      case 4: // التقارير
        getUserReports(
          userId: userId,
        );
        break;
      case 5: // الملاحظات
        getUserFeedbacks(userId: userId);
        break;
    }
    emit(TabIndexState());
  }

  Future<void> _loadStatisticsData() async {
    tabLoadingStates[1] = true;
    tabErrorStates[1] = null;
    tabData[1] = null;
    emit(TabLoadingState(tabIndex: 1));

    try {
      // هنا ضع استدعاء API للإحصائيات
      await Future.delayed(
          const Duration(milliseconds: 500)); // محاكاة API call

      tabLoadingStates[1] = false;
      tabData[1] = "statistics_data"; // ضع البيانات الحقيقية هنا

      emit(TabLoadedState(tabIndex: 1));
    } catch (e) {
      tabLoadingStates[1] = false;
      tabErrorStates[1] = e.toString();
      emit(TabErrorState(tabIndex: 1, errorMessage: e.toString()));
    }
  }

  // دالة للحصول على حالة التحميل للـ tab الحالي
  bool get isCurrentTabLoading => tabLoadingStates[controller.index] ?? false;

  // دالة للحصول على بيانات الـ tab الحالي
  dynamic get currentTabData => tabData[controller.index];

  // دالة للحصول على خطأ الـ tab الحالي
  String? get currentTabError => tabErrorStates[controller.index];

  List<Widget> get screens => [
        _buildSchedulesBody(),
        _buildStatsBody(),
        _buildExamBody(),
        _buildDeliveriesBody(),
        _buildReportBody(),
        _buildNotesBody(),
      ];

  // بناء محتوى كل tab مع إدارة حالة التحميل المحدثة
  Widget _buildSchedulesBody() {
    if (tabLoadingStates[0] == true) {
      return const Center(child: CircularProgressIndicator());
    }

    if (tabErrorStates[0] != null) {
      return _buildErrorWidget(
          0,
          () => getProgramSessions(
                programId: currentProgramId,
                userId: userId,
              ));
    }

    if (tabData[0] == null ||
        (getProgramSessionsEntity?.data?.isEmpty ?? true)) {
      return _buildEmptyWidget("لا توجد مواعيد متاحة");
    }

    return const SchedulesBody();
  }

  Widget _buildStatsBody() {
    if (tabLoadingStates[1] == true) {
      return const Center(child: CircularProgressIndicator());
    }

    if (tabErrorStates[1] != null) {
      return _buildErrorWidget(1, () => _loadStatisticsData());
    }

    if (tabData[1] == null) {
      return _buildEmptyWidget("لا توجد إحصائيات متاحة");
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

    if (tabErrorStates[2] != null) {
      return _buildErrorWidget(
          2,
          () => getUserQuizzes(
                programId: currentProgramId,
              ));
    }

    if (tabData[2] == null || (getUserQuizzesEntity?.data?.isEmpty ?? true)) {
      return _buildEmptyWidget("لا توجد امتحانات متاحة");
    }

    return const ExamBodyWidget();
  }

  Widget _buildDeliveriesBody() {
    if (tabLoadingStates[3] == true) {
      return const Center(child: CircularProgressIndicator());
    }

    if (tabErrorStates[3] != null) {
      return _buildErrorWidget(
          3,
          () => getProgramAssignments(
                programId: currentProgramId,
                userId: userId,
              ));
    }

    if (tabData[3] == null ||
        (getProgramAssignmentsEntity?.data?.isEmpty ?? true)) {
      return _buildEmptyWidget("لا توجد تسليمات متاحة");
    }

    return const DeliveriesBodyWidget();
  }

  Widget _buildReportBody() {
    if (tabLoadingStates[4] == true) {
      return const Center(child: CircularProgressIndicator());
    }

    if (tabErrorStates[4] != null) {
      return _buildErrorWidget(
          4,
          () => getUserReports(
                userId: userId,
              ));
    }

    if (tabData[4] == null || (getUserReportsEntity?.data?.isEmpty ?? true)) {
      return _buildEmptyWidget("لا توجد تقارير متاحة");
    }

    return const ReportBody();
  }

  Widget _buildNotesBody() {
    if (tabLoadingStates[5] == true) {
      return const Center(child: CircularProgressIndicator());
    }

    if (tabErrorStates[5] != null) {
      return _buildErrorWidget(
          5,
          () => getUserFeedbacks(
                userId: userId,
              ));
    }

    if (tabData[5] == null || (getUserFeedbacksEntity?.data?.isEmpty ?? true)) {
      return _buildEmptyWidget("لا توجد ملاحظات متاحة");
    }

    return const NotesBodyWidget();
  }

  Widget _buildErrorWidget(int tabIndex, VoidCallback onRetry) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 50, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            tabErrorStates[tabIndex] ?? "حدث خطأ غير متوقع",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text("إعادة المحاولة"),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyWidget(String message) {
    return NoDataAnimatedImageWidget(
      message: message,
      width: 200.w,
      height: 200.h,
    );
  }

  var tabs = [
    "المواعيد",
    "الإحصائيات",
    "الإمتحانات",
    "التسليمات",
    "التقارير",
    "الملاحظات",
  ];

  List<bool> isSelected = [];
  void changeSelected(int index) {
    isSelected[index] = !isSelected[index];
    emit(ChangeSelectedState());
  }

  fillSelected(int listLength) {
    for (var i = 0; i < listLength; i++) {
      isSelected.add(false);
    }
  }

  // بيانات التطبيق الحالية
  bool showProgramDetailsLoader = false;
  ShowProgramDetailsEntity? showProgramDetailsEntity;
  ShowProgramDetailsUsecase showProgramDetailsUsecase;

  Future<void> showProgramDetails({required int programId}) async {
    showProgramDetailsLoader = true;
    emit(ShowProgramDetailsLoadingState());

    try {
      final result = await showProgramDetailsUsecase.call(
          parameter: ShowProgramDetailsParameters(programId: programId));
      result.fold((failure) {
        showProgramDetailsLoader = false;
        emit(ShowProgramDetailsErrorState(errorMessage: failure.message));
      }, (success) {
        showProgramDetailsLoader = false;
        showProgramDetailsEntity = success;
        emit(ShowProgramDetailsSuccessState());
      });
    } catch (e) {
      showProgramDetailsLoader = false;
      emit(ShowProgramDetailsErrorState(errorMessage: e.toString()));
    }
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
    tabErrorStates[0] = null;
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
        tabErrorStates[0] = failure.message;
        getProgramSessionsLoader = false;
        emit(GetProgramSessionsErrorState(errorMessage: failure.message));
      },
      (data) {
        tabLoadingStates[0] = false;
        tabErrorStates[0] = null;
        getProgramSessionsLoader = false;
        getProgramSessionsEntity = data;
        tabData[0] = data;
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
    tabErrorStates[3] = null;
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
        tabErrorStates[3] = failure.message;
        getProgramAssignmentsLoader = false;
        emit(GetProgramAssignmentsErrorState(errorMessage: failure.message));
      },
      (data) {
        tabLoadingStates[3] = false;
        tabErrorStates[3] = null;
        getProgramAssignmentsLoader = false;
        getProgramAssignmentsEntity = data;
        tabData[3] = data;
        emit(GetProgramAssignmentsSuccessState());
      },
    );
  }

  bool getUserReportsLoader = false;
  GetUserReportsEntity? getUserReportsEntity;
  GetUserReportsUsecase getUserReportsUsecase;

  Future<void> getUserReports({
    required int userId,
  }) async {
    tabLoadingStates[4] = true;
    tabErrorStates[4] = null;
    getUserReportsLoader = true;
    emit(GetUserReportsLoadingState());

    final result = await getUserReportsUsecase.call(
      parameter: GetUserReportsParameters(
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        tabLoadingStates[4] = false;
        tabErrorStates[4] = failure.message;
        getUserReportsLoader = false;
        emit(GetUserReportsErrorState(errorMessage: failure.message));
      },
      (data) {
        tabLoadingStates[4] = false;
        tabErrorStates[4] = null;
        getUserReportsLoader = false;
        getUserReportsEntity = data;
        tabData[4] = data;
        emit(GetUserReportsSuccessState());
      },
    );
  }

  bool getUserFeedbacksLoader = false;
  GetUserFeedbacksEntity? getUserFeedbacksEntity;
  GetUserFeedbackUsecase getUserFeedbacksUsecase;

  Future<void> getUserFeedbacks({
    required int userId,
  }) async {
    tabLoadingStates[5] = true;
    tabErrorStates[5] = null;
    getUserFeedbacksLoader = true;
    emit(GetUserFeedbacksLoadingState());

    final result = await getUserFeedbacksUsecase.call(
      parameter: GetUserFeedbackParameters(
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        tabLoadingStates[5] = false;
        tabErrorStates[5] = failure.message;
        getUserFeedbacksLoader = false;
        emit(GetUserFeedbacksErrorState(errorMessage: failure.message));
      },
      (data) {
        tabLoadingStates[5] = false;
        tabErrorStates[5] = null;
        getUserFeedbacksLoader = false;
        getUserFeedbacksEntity = data;
        tabData[5] = data;
        emit(GetUserFeedbacksSuccessState());
      },
    );
  }

  bool getChapterLessonsLoader = false;
  GetChapterLessonsEntity? chapterLessonsEntity;
  GetChapterLessonsUsecase getChapterLessonsUsecase;

  Future<void> getChapterLessons({
    required int chapterId,
  }) async {
    getChapterLessonsLoader = true;
    emit(GetChapterLessonsLoadingState());

    final result = await getChapterLessonsUsecase.call(
      parameter: GetChapterLessonsParameters(
        chapterId: chapterId,
      ),
    );

    result.fold(
      (failure) {
        getChapterLessonsLoader = false;
        emit(GetChapterLessonsErrorState(errorMessage: failure.message));
      },
      (data) {
        getChapterLessonsLoader = false;
        chapterLessonsEntity = data;
        fillSelected(data.data?.length ?? 0);
        emit(GetChapterLessonsSuccessState());
      },
    );
  }

  bool getContentChaptersLoader = false;
  GetContentChapterEntity? getContentChapterEntity;
  GetContentChapterUsecase getContentChaptersUsecase;

  Future<void> getContentChapters({
    required int userId,
  }) async {
    getContentChaptersLoader = true;
    emit(GetContentChaptersLoadingState());

    final result = await getContentChaptersUsecase.call(
      parameter: GetContentChapterParameters(
        userId: userId,
      ),
    );

    result.fold(
      (failure) {
        getContentChaptersLoader = false;
        emit(GetContentChaptersErrorState(errorMessage: failure.message));
      },
      (data) {
        getContentChaptersLoader = false;
        getContentChapterEntity = data;
        emit(GetContentChaptersSuccessState());
      },
    );
  }

  bool getAssignmentDetailsLoader = false;
  GetAssignmentDetailsEntity? getAssignmentDetailsEntity;
  GetAssignmentDetailsUsecase getAssignmentDetailsUsecase;

  Future<void> getAssignmentDetails({
    required int assignmentId,
  }) async {
    getAssignmentDetailsLoader = true;
    emit(GetAssignmentDetailsLoadingState());

    final result = await getAssignmentDetailsUsecase.call(
      parameter: GetAssignmentDetailsParameters(
        userId: userId,
        programId: currentProgramId,
      ),
    );

    result.fold(
      (failure) {
        getAssignmentDetailsLoader = false;
        emit(GetAssignmentDetailsErrorState(failure.message));
      },
      (data) {
        getAssignmentDetailsLoader = false;
        getAssignmentDetailsEntity = data;
        emit(GetAssignmentDetailsSuccessState());
      },
    );
  }

  bool completeChapterLessonLoader = false;
  CompleteChapterLessonEntity? completeChapterLessonEntity;
  CompleteChapterLessonUsecase completeChapterLessonUsecase;

  Future<void> completeChapterLesson({
    required int lessonId,
    required int userId,
  }) async {
    completeChapterLessonLoader = true;
    emit(CompleteChapterLessonLoadingState());

    final result = await completeChapterLessonUsecase.call(
      parameter: CompleteChapterLessonParameters(
        lessonId: lessonId,
      ),
    );

    result.fold(
      (failure) {
        completeChapterLessonLoader = false;
        emit(CompleteChapterLessonErrorState(errorMessage: failure.message));
      },
      (data) {
        completeChapterLessonLoader = false;
        completeChapterLessonEntity = data;

        // تحديث حالة الدرس في البيانات المحلية
        if (chapterLessonsEntity?.data != null) {
          final lessonIndex = chapterLessonsEntity!.data!
              .indexWhere((lesson) => lesson.id == lessonId);

          if (lessonIndex != -1) {
            // تحديث isDone للدرس المحدد
            chapterLessonsEntity!.data![lessonIndex].isDone = true;
          }
        }

        emit(CompleteChapterLessonSuccessState());
      },
    );
  }

  // إضافة الـ usecases للـ constructor
  final GetUserQuizzesUsecase getUserQuizzesUsecase;

  // متغيرات getUserQuizzes
  bool getUserQuizzesLoader = false;
  GetUserQuizzesEntity? getUserQuizzesEntity;

  Future<void> getUserQuizzes({
    required int programId,
  }) async {
    getUserQuizzesLoader = true;
    tabLoadingStates[2] = true;
    emit(GetUserQuizzesLoadingState());

    final result = await getUserQuizzesUsecase.call(
      parameter: GetUserQuizzesParameters(
        userId: userId,
        programId: programId,
      ),
    );

    result.fold(
      (failure) {
        getUserQuizzesLoader = false;
        tabLoadingStates[2] = false;

        emit(GetUserQuizzesErrorState(errorMessage: failure.message));
      },
      (data) {
        tabData[2] = data;
        getUserQuizzesLoader = false;
        tabLoadingStates[2] = false;

        getUserQuizzesEntity = data;
        emit(GetUserQuizzesSuccessState());
      },
    );
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
