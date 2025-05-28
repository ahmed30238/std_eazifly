abstract class ProgramsubscriptionplanState {}

class ProgramsubscriptionplanInitial extends ProgramsubscriptionplanState {}

class GetGalleryImagesState extends ProgramsubscriptionplanState {}

class ChangePlanIndexState extends ProgramsubscriptionplanState {}

class ChangeLessonDurationIndexState extends ProgramsubscriptionplanState {}

class GetPlansLoadingState extends ProgramsubscriptionplanState {}

class GetPlansErrorState extends ProgramsubscriptionplanState {
  final String errorMessage;

  GetPlansErrorState({required this.errorMessage});
}

class GetPlansSuccessState extends ProgramsubscriptionplanState {}

class FilterPlansLoadingState extends ProgramsubscriptionplanState {}

class FilterPlansErrorState extends ProgramsubscriptionplanState {
  final String errorMessage;

  FilterPlansErrorState({required this.errorMessage});
}

class FilterPlansSuccessState extends ProgramsubscriptionplanState {}

class CreateOrderLoadingState extends ProgramsubscriptionplanState {}

class CreateOrderErrorState extends ProgramsubscriptionplanState {
  final String errorMessage;

  CreateOrderErrorState({required this.errorMessage});
}

class CreateOrderSuccessState extends ProgramsubscriptionplanState {}

class CheckCopounLoadingState extends ProgramsubscriptionplanState {}

class CheckCopounErrorState extends ProgramsubscriptionplanState {
  final String errorMessage;

  CheckCopounErrorState({required this.errorMessage});
}

class CheckCopounSuccessState extends ProgramsubscriptionplanState {}
