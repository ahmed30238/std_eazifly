abstract class LectureState {}

class LectureInitial extends LectureState {}

class TabIndexState extends LectureState {}

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
class ReportsLoadedState extends LectureState {}

class ReportsErrorState extends LectureState {
  final String errorMessage;
  ReportsErrorState({required this.errorMessage});
}

// حالات الملاحظات
class NotesLoadedState extends LectureState {}

class NotesErrorState extends LectureState {
  final String errorMessage;
  NotesErrorState({required this.errorMessage});
}
