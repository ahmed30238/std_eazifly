import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/core/component/spline_area_chart.dart';
import 'package:eazifly_student/core/component/stats_area.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/enums/student_success_status.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/data/models/my_programs/post_assignment_tojson.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/complete_chapter_lesson_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_chapter_lessons_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_content_chapter.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_assignment_details_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_assignments_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_program_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_report_questions_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_user_feedbacks_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/get_user_reports_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/post_assignment_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/quizzes/get_user_quizzes_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/show_program_details_entity.dart';
import 'package:eazifly_student/domain/use_cases/complete_chapter_lesson_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_assignment_details_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_chapter_lessons_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_content_chapter_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_assignments_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_program_sessions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_report_questions_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_feedback_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_quizzes_usecase.dart';
import 'package:eazifly_student/domain/use_cases/get_user_reports_usecase.dart';
import 'package:eazifly_student/domain/use_cases/post_assignment_usecase.dart';
import 'package:eazifly_student/domain/use_cases/show_program_details_usecase.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_state.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/deliveries_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/exam_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/notes_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/report_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/schedules_body.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

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
    required this.postAssignmentUsecase,
    required this.getReportQuestionsUsecase,
  }) : super(LectureInitial()) {
    var loginData = DataModel.fromJson(
        jsonDecode(GetStorage().read(StorageEnum.loginModel.name)));
    fillUserId(loginData.id ?? -1);
    // userId =
    log("$userId");
  }
  File? profileImage;
  Future<void> pickProfileImageFroGallery() async {
    final response = await pickImageFromGallery();
    if (response != null) {
      profileImage = File(response.path);
    }
    emit(PickImageFromGallerySuccessState());
  }

  static LectureCubit get(context) => BlocProvider.of(context);
  late TabController controller;
  int userId = -1;
  fillUserId(int value) {
    userId = value;
  }

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
        log("this is report for id ${data.data?[0].reportForId}");
        tabLoadingStates[4] = false;
        tabErrorStates[4] = null;
        getUserReportsLoader = false;
        getUserReportsEntity = data;
        tabData[4] = data;
        emit(GetUserReportsSuccessState());
      },
    );
  }

  int currentChildIndex = -1; // -1 يعني المستخدم الأب
  final scrollController = ScrollController();

  void showParent() {
    currentChildIndex = -1;
    emit(ChildIndexChanged());
  }

  void updateChildIndex(bool next, int totalChildren) {
    if (totalChildren == 0) return;

    if (currentChildIndex == -1) {
      // أول ضغطة على "التالي"، ننتقل إلى أول طفل
      currentChildIndex = 0;
    } else {
      if (next) {
        currentChildIndex = (currentChildIndex + 1) % totalChildren;
      } else {
        currentChildIndex =
            currentChildIndex > 0 ? currentChildIndex - 1 : -1; // نرجع للأب
      }
    }

    emit(ChildIndexChanged());
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
    log("$userId");
    getAssignmentDetailsLoader = true;
    emit(GetAssignmentDetailsLoadingState());

    final result = await getAssignmentDetailsUsecase.call(
      parameter: GetAssignmentDetailsParameters(
        userId: userId,
        assignmentId: assignmentId,
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
        tabErrorStates[2] = failure.message;

        emit(GetUserQuizzesErrorState(errorMessage: failure.message));
      },
      (data) {
        tabLoadingStates[2] = false;
        tabErrorStates[2] = null;
        tabData[2] = data;
        getUserQuizzesLoader = false;
        getUserQuizzesEntity = data;
        log("${getUserQuizzesEntity?.data?.length}");
        emit(GetUserQuizzesSuccessState());
      },
    );
  }

  static StudentStatus calculateStudentStatus({
    required dynamic totalMark,
    required dynamic fullMark,
    String? quizStatus,
    double passPercentage = 60.0, // النسبة المطلوبة للنجاح
    double excellentPercentage = 85.0, // النسبة المطلوبة للامتياز
  }) {
    // إذا كان الامتحان في حالة انتظار أو لم يتم حله بعد
    if (quizStatus == "pending" || totalMark == null || fullMark == null) {
      return StudentStatus.pending;
    }

    // تحويل العلامات إلى أرقام للمقارنة
    double studentMark = 0.0;
    double maxMark = 0.0;

    try {
      if (totalMark is String) {
        studentMark = double.tryParse(totalMark) ?? 0.0;
      } else if (totalMark is num) {
        studentMark = totalMark.toDouble();
      }

      if (fullMark is String) {
        maxMark = double.tryParse(fullMark) ?? 0.0;
      } else if (fullMark is num) {
        maxMark = fullMark.toDouble();
      }
    } catch (e) {
      log("Error parsing marks in calculateStudentStatus: $e");
      return StudentStatus.pending;
    }

    // إذا كانت العلامة الكاملة صفر أو أقل، تجنب القسمة على صفر
    if (maxMark <= 0) {
      log("Invalid max mark: $maxMark");
      return StudentStatus.pending;
    }

    // حساب النسبة المئوية
    double percentage = (studentMark / maxMark) * 100;

    log("Student Mark: $studentMark, Full Mark: $maxMark, Percentage: ${percentage.toStringAsFixed(2)}%");

    // تحديد الحالة بناءً على النسبة المئوية
    if (percentage >= excellentPercentage) {
      return StudentStatus.successful; // ناجح (ممتاز)
    } else if (percentage >= passPercentage) {
      return StudentStatus.acceptable; // مقبول
    } else {
      return StudentStatus.failed; // راسب
    }
  }

  /// دالة لحساب النسبة المئوية للعلامة
  static double calculatePercentage({
    required dynamic totalMark,
    required dynamic fullMark,
  }) {
    try {
      double studentMark = 0.0;
      double maxMark = 0.0;

      if (totalMark is String) {
        studentMark = double.tryParse(totalMark) ?? 0.0;
      } else if (totalMark is num) {
        studentMark = totalMark.toDouble();
      }

      if (fullMark is String) {
        maxMark = double.tryParse(fullMark) ?? 0.0;
      } else if (fullMark is num) {
        maxMark = fullMark.toDouble();
      }

      if (maxMark > 0) {
        return (studentMark / maxMark) * 100;
      }
      return 0.0;
    } catch (e) {
      log("Error calculating percentage: $e");
      return 0.0;
    }
  }

  PostAssignmentEntity? postAssignmentEntity;
  PostAssignmentUsecase postAssignmentUsecase;
  bool postAssignmentLoader = false;

  TextEditingController assignmentAnswerController = TextEditingController();
  File? selectedFile;

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png', 'mp3', 'm4a'],
      );

      if (result != null && result.files.single.path != null) {
        selectedFile = File(result.files.single.path!);
        log("تم اختيار الملف: ${selectedFile!.path}");
      } else {
        log("تم إلغاء اختيار الملف");
      }
    } on MissingPluginException catch (e) {
      log("❌ Plugin غير مدعوم أو لم يتم تهيئته بعد: $e");
    } on PlatformException catch (e) {
      log("❌ خطأ من النظام الأساسي: ${e.message}");
    } catch (e) {
      log("❌ حصل استثناء غير متوقع: $e");
    }
    emit(PickedFileSuccessfully());
  }

  Future<void> postAssignment({
    required String sessionAssignmentId,
  }) async {
    try {
      postAssignmentLoader = true;
      emit(PostAssignmentLoadingState());

      PostAssignmentTojson data = PostAssignmentTojson(
        sessionAssignmentId: sessionAssignmentId,
        studentAnswer: assignmentAnswerController.text,
        file: selectedFile!,
        voiceNote: voiceNote,
      );

      final result = await postAssignmentUsecase.call(
          parameter: PostAssignmentParameters(data: data));

      result.fold(
        (failure) {
          postAssignmentLoader = false;
          emit(PostAssignmentErrorState(failure.message));
        },
        (success) {
          postAssignmentLoader = false;
          postAssignmentEntity = success;
          emit(PostAssignmentSuccessState()); // أو ابعت الـ entity هنا
        },
      );
    } catch (error) {
      postAssignmentLoader = false;
      emit(PostAssignmentErrorState(error.toString()));
    }
  }

  //! post assignment
  List<File> images = [];

  Future<void> pickImages() async {
    final response = await pickMultiImageFromGallery();
    if (response != null) {
      images = List.from(response.map((e) => File(e.path)));
    }
    emit(GetGalleryImagesState());
  }

  // أضف هذه المتغيرات في أعلى الكلاس
  File? voiceNote;
  bool isRecording = false;
  bool isPlaying = false;
  String recordPath = "";
  late AudioRecorder audioRecord;
  late AudioPlayer audioPlayer;

// دالة تهيئة التسجيل
  void initializeRecordVars() {
    audioPlayer = AudioPlayer();
    audioRecord = AudioRecorder();

    audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      if (state == PlayerState.completed) {
        isPlaying = false;
        emit(StopPlayingRecordState());
      }
    });
  }

// دالة للحصول على مسار الحفظ
  Future<String> getRecordPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
  }

// بدء التسجيل
  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        recordPath = await getRecordPath();
        await audioRecord.start(
          const RecordConfig(
            encoder: AudioEncoder.aacLc,
            androidConfig: AndroidRecordConfig(
              audioSource: AndroidAudioSource.mic,
              // sampleRate: 44100,
            ),
          ),
          path: recordPath,
        );
        isRecording = true;
        emit(StartRecordState());
      }
    } catch (e) {
      log("Error starting recording: $e");
      emit(RecordErrorState());
    }
  }

// إيقاف التسجيل
  Future<void> stopRecording() async {
    try {
      final path = await audioRecord.stop();
      isRecording = false;
      if (path != null) {
        voiceNote = File(path);
        emit(StopRecordState());
      }
    } catch (e) {
      log("Error stopping recording: $e");
      emit(RecordErrorState());
    }
  }

// تشغيل التسجيل
  Future<void> playRecording() async {
    if (voiceNote != null) {
      await audioPlayer.play(DeviceFileSource(voiceNote!.path));
      isPlaying = true;
      emit(PlayRecordState());
    }
  }

  /// تشغيل تسجيل صوتي من URL خارجي
  Future<void> playExternalSourceAudio(String audioUrl) async {
    try {
      // إذا كان هناك تسجيل مشغّل حالياً، أوقفه أولاً
      if (isPlaying) {
        await audioPlayer.stop();
      }

      // تحقق من اتصال الإنترنت إذا كان URL خارجي
      if (audioUrl.startsWith('http')) {
        // يمكنك إضافة تحقق من الاتصال هنا إذا لزم الأمر
      }

      // بدء التشغيل من المصدر الخارجي
      await audioPlayer.play(UrlSource(audioUrl));
      isPlaying = true;
      emit(PlayExternalAudioState());

      // إعداد مستمع لانتهاء التشغيل
      audioPlayer.onPlayerComplete.listen((_) {
        isPlaying = false;
        emit(StopExternalAudioState());
      });

      // إعداد مستمع للأخطاء
      // audioPlayer.onPlayerError.listen((error) {
      //   log('Error playing external audio: $error');
      //   isPlaying = false;
      //   emit(AudioErrorState(error: 'فشل تشغيل التسجيل'));
      // });
    } catch (e) {
      log('Exception in playExternalSourceAudio: $e');
      isPlaying = false;
      emit(AudioErrorState());
    }
  }

  ///! files
  final Map<String, bool> _isDownloading = {};
  final Map<String, double> _downloadingProgress = {};
  final Map<String, String> _downloadedFiles =
      {}; // key: fileUrl, value: local path
  Future<void> _downloadAndOpenPdf(
      {required String fileUrl,
      required String title,
      required BuildContext context}) async {
    try {
      _isDownloading[fileUrl] = true;
      _downloadingProgress[fileUrl] = 0.0;
      emit(DownLoadPdfLoadingState());

      final directory = await getApplicationDocumentsDirectory();
      final fileName = "${title.replaceAll(RegExp(r'[^\w\s-]'), "")}.pdf";
      final filePath = "${directory.path}/$fileName";

      Dio dio = Dio();
      await dio.download(
        fileUrl,
        filePath,
        onReceiveProgress: (count, total) {
          if (total != -1) {
            _downloadingProgress[fileUrl] = count / total;
            emit(DownLoadPdfLoadingState());
          }
        },
      );
      _downloadedFiles[fileUrl] = filePath;
      _isDownloading[fileUrl] = false;
      _downloadingProgress[fileUrl] = 1.0;
      emit(DownLoadPdfSuccessState());
      if (context.mounted) {
        return;
      }
      await _openDownloadedFile(filePath: filePath, context: context);
    } catch (e) {
      _isDownloading[fileUrl] = false;
      _downloadingProgress.remove(fileUrl);
      emit(DownLoadPdfErrorState());
      delightfulToast(message: 'فشل في تحميل الملف: $e', context: context);
    }
  }

  Future<void> _openDownloadedFile(
      {required String filePath, required BuildContext context}) async {
    try {
      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        delightfulToast(
            message: 'لا يوجد تطبيق مناسب لفتح هذا الملف', context: context);
      }
    } catch (e) {
      if (context.mounted) {
        return;
      }
      delightfulToast(message: 'فشل في فتح الملف: $e', context: context);
    }
  }

  Future<void> openFile({
    required String fileUrl,
    required String fileType,
    required BuildContext context,
    required String title,
  }) async {
    try {
      if (_downloadedFiles.containsKey(fileUrl)) {
        await _openDownloadedFile(
            filePath: _downloadedFiles[fileUrl]!, context: context);
        return;
      }

      switch (fileType.toLowerCase()) {
        case "pdf":
          await _downloadAndOpenPdf(
              fileUrl: fileUrl, title: title, context: context);
          break;

        default:
          delightfulToast(context: context, message: "نوع الملف غير مدعوم");
      }
    } catch (e) {
      delightfulToast(
        message: 'حدث خطأ في فتح الملف: $e',
        context: context,
      );
    }
  }

// إيقاف التشغيل
  Future<void> stopPlaying() async {
    await audioPlayer.stop();
    isPlaying = false;
    emit(StopPlayingRecordState());
  }

// حذف التسجيل
  void deleteRecording() {
    voiceNote?.delete();
    voiceNote = null;
    recordPath = "";
    emit(DeleteRecordState());
  }

// متغيرات حالة التحميل والنتيجة
  bool getReportQuestionsLoader = false;
  GetReportQuestionsEntity? reportQuestionsEntity;
  GetReportQuestionsUsecase getReportQuestionsUsecase;

  Future<void> getReportQuestions({required int index}) async {
    // log("${data.data?[0].program}");
    log("this is report maker ${int.tryParse(getUserReportsEntity?.data?[index].reportMakerId ?? "") ?? 0}");
    log("this is report for ${getUserReportsEntity?.data?[index].reportForId ?? "0"}");
    getReportQuestionsLoader = true;
    emit(GetReportQuestionsLoadingState());

    final result = await getReportQuestionsUsecase.call(
      parameter: GetQuizQuestionsParameters(
        meetingSessionId: int.tryParse(
                getUserReportsEntity?.data?[index].meetingSessionId ?? "0") ??
            0,
        reportForId: int.tryParse(
              getUserReportsEntity?.data?[index].reportForId ?? "0",
            ) ??
            0,
        reportForType: getUserReportsEntity?.data?[index].reportForType ?? "",
        reportMakerId: int.tryParse(
                getUserReportsEntity?.data?[index].reportMakerId ?? "") ??
            -1,
        reportMakerType:
            getUserReportsEntity?.data?[index].reportMakerType ?? "",
      ),
    );

    result.fold(
      (failure) {
        getReportQuestionsLoader = false;
        emit(GetReportQuestionsErrorState(
          errorMessage: failure.message,
        ));
      },
      (data) {
        getReportQuestionsLoader = false;
        reportQuestionsEntity = data;
        log("${data.data?[0].program}");
        log("${int.tryParse(getUserReportsEntity?.data?[index].reportMakerId ?? "") ?? 0}");
        log(getUserReportsEntity?.data?[index].reportForId ?? "0");

        emit(GetReportQuestionsSuccessState());
      },
    );
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }

  void removeAttachedFile(int index) {
    selectedFile = null;
    emit(AssignmentFileRemovedState());
  }
}
