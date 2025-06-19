abstract class LectureState {}

class LectureInitial extends LectureState {}

class TabIndexState extends LectureState {}

class ChangeSelectedState extends LectureState {}

class ShowProgramDetailsSuccessState extends LectureState {}

class ShowProgramDetailsErrorState extends LectureState {
  final String errorMessage;

  ShowProgramDetailsErrorState({required this.errorMessage});
}

class ShowProgramDetailsLoadingState extends LectureState {}

class GetProgramSessionsSuccessState extends LectureState {}

class GetProgramSessionsErrorState extends LectureState {
  final String errorMessage;

  GetProgramSessionsErrorState({required this.errorMessage});
}

class GetProgramSessionsLoadingState extends LectureState {}
// إضافة هذه الحالات الجديدة لـ LectureState

// حالات الإحصائيات
class StatisticsLoadedState extends LectureState {}

class StatisticsErrorState extends LectureState {
  final String errorMessage;
  StatisticsErrorState({required this.errorMessage});
}

// حالات الإمتحانات
class ExamsLoadedState extends LectureState {}

class ExamsErrorState extends LectureState {
  final String errorMessage;
  ExamsErrorState({required this.errorMessage});
}

// حالات التسليمات
class GetProgramAssignmentsSuccessState extends LectureState {}

class GetProgramAssignmentsLoadingState extends LectureState {}

class GetProgramAssignmentsErrorState extends LectureState {
  final String errorMessage;
  GetProgramAssignmentsErrorState({required this.errorMessage});
}

// حالات التقارير
class GetUserReportsSuccessState extends LectureState {}

class GetUserReportsLoadingState extends LectureState {}

class GetUserReportsErrorState extends LectureState {
  final String errorMessage;
  GetUserReportsErrorState({required this.errorMessage});
}

// حالات الملاحظات
class GetUserFeedbacksSuccessState extends LectureState {}

class GetUserFeedbacksLoadingState extends LectureState {}

class GetUserFeedbacksErrorState extends LectureState {
  final String errorMessage;
  GetUserFeedbacksErrorState({required this.errorMessage});
}

// لحالات ChapterLessons
class GetChapterLessonsLoadingState extends LectureState {}

class GetChapterLessonsSuccessState extends LectureState {}

class GetChapterLessonsErrorState extends LectureState {
  final String errorMessage;

  GetChapterLessonsErrorState({required this.errorMessage});
}

// لحالات ContentChapters
class GetContentChaptersLoadingState extends LectureState {}

class GetContentChaptersSuccessState extends LectureState {}

class GetContentChaptersErrorState extends LectureState {
  final String errorMessage;

  GetContentChaptersErrorState({required this.errorMessage});
}

// لحالات CompleteChapterLesson
class CompleteChapterLessonLoadingState extends LectureState {}

class CompleteChapterLessonSuccessState extends LectureState {}

class CompleteChapterLessonErrorState extends LectureState {
  final String errorMessage;

  CompleteChapterLessonErrorState({required this.errorMessage});
}
