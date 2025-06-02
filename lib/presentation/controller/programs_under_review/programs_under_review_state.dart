abstract class ProgramsUnderReviewState {}

class ProgramsUnderReviewInitial extends ProgramsUnderReviewState {}

class GetUserOrdersLoadingState extends ProgramsUnderReviewState {}

class GetUserOrdersErrorState extends ProgramsUnderReviewState {
  final String errorMessage;

  GetUserOrdersErrorState({required this.errorMessage});
}

class GetUserOrdersSuccessState extends ProgramsUnderReviewState {}
