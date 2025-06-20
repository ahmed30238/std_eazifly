abstract class LecturequizState {}

class LecturequizInitial extends LecturequizState {}

class ChangeTrueFalseIndexState extends LecturequizState {}

class ChangeMulipleChoiceIndexState extends LecturequizState {}

// Get Quiz Questions States
class GetQuizQuestionsLoadingState extends LecturequizState {}

class GetQuizQuestionsSuccessState extends LecturequizState {}

class GetQuizQuestionsErrorState extends LecturequizState {
  final String errorMessage;
  GetQuizQuestionsErrorState({required this.errorMessage});
}

// Submit Quiz States
class SubmitQuizLoadingState extends LecturequizState {}

class SubmitQuizSuccessState extends LecturequizState {}

class SubmitQuizErrorState extends LecturequizState {
  final String errorMessage;
  SubmitQuizErrorState({required this.errorMessage});
}
