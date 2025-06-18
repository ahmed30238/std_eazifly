abstract class LectureState {}

class LectureInitial extends LectureState {}

class TabIndexState extends LectureState {}
class ShowProgramDetailsSuccessState extends LectureState {}
class ShowProgramDetailsErrorState extends LectureState {
  final String errorMessage;

  ShowProgramDetailsErrorState({required this.errorMessage});
}
class ShowProgramDetailsLoadingState extends LectureState {}
