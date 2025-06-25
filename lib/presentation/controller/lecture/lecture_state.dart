abstract class LectureState {}

class LectureInitial extends LectureState {}

class TabIndexState extends LectureState {}

class ChangeSelectedState extends LectureState {}

class ShowProgramDetailsSuccessState extends LectureState {}

class ShowProgramDetailsErrorState extends LectureState {
  final String errorMessage;

  ShowProgramDetailsErrorState({required this.errorMessage});
}

class GetAssignmentDetailsLoadingState extends LectureState {}

class GetAssignmentDetailsSuccessState extends LectureState {
  GetAssignmentDetailsSuccessState();
}

class GetAssignmentDetailsErrorState extends LectureState {
  final String errorMessage;
  GetAssignmentDetailsErrorState(this.errorMessage);
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

class PostAssignmentInitialState extends LectureState {}

class PostAssignmentLoadingState extends LectureState {}

class PostAssignmentSuccessState extends LectureState {
  PostAssignmentSuccessState();
}

class PickImageFromGallerySuccessState extends LectureState {
  PickImageFromGallerySuccessState();
}

class PostAssignmentErrorState extends LectureState {
  final String error;
  PostAssignmentErrorState(this.error);
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

// Get User Quizzes States
class GetUserQuizzesLoadingState extends LectureState {}

class GetUserQuizzesSuccessState extends LectureState {}

class GetUserQuizzesErrorState extends LectureState {
  final String errorMessage;
  GetUserQuizzesErrorState({required this.errorMessage});
}

// حالات خاصة بالتابات
class TabLoadingState extends LectureState {
  final int tabIndex;
  TabLoadingState({required this.tabIndex});
}

class TabLoadedState extends LectureState {
  final int tabIndex;
  TabLoadedState({required this.tabIndex});
}

class TabErrorState extends LectureState {
  final int tabIndex;
  final String errorMessage;
  TabErrorState({required this.tabIndex, required this.errorMessage});
}

class TabEmptyState extends LectureState {
  final int tabIndex;
  final String message;
  TabEmptyState({required this.tabIndex, required this.message});
}

class GetGalleryImagesState extends LectureState {}

class RecordState extends LectureState {}

class RecordSecondState extends LectureState {}

class AssignmentFileRemovedState extends LectureState {}

class RecordThirdState extends LectureState {}

class StartRecordState extends LectureState {}

class PickedFileSuccessfully extends LectureState {}

class StopRecordState extends LectureState {}

class StopPlayingRecordState extends LectureState {}

class PlayRecordState extends LectureState {}

class RecordErrorState extends LectureState {}

class DeleteRecordState extends LectureState {}

class AudioErrorState extends LectureState {}

class ChildIndexChanged extends LectureState {}

class StopExternalAudioState extends LectureState {}

class PlayExternalAudioState extends LectureState {}

class DownLoadPdfErrorState extends LectureState {}

class DownLoadPdfSuccessState extends LectureState {}

class DownLoadPdfLoadingState extends LectureState {}

class GetReportQuestionsLoadingState extends LectureState {}

class GetReportQuestionsErrorState extends LectureState {
  final String errorMessage;

  GetReportQuestionsErrorState({required this.errorMessage});
}

class GetReportQuestionsSuccessState extends LectureState {}
