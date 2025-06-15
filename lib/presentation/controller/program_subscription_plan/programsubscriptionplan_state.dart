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

class GetProgramPaymentMethodDetailsSuccessState
    extends ProgramsubscriptionplanState {}

class GetProgramPaymentMethodDetailsErrorState
    extends ProgramsubscriptionplanState {
  final String errorMessage;

  GetProgramPaymentMethodDetailsErrorState({required this.errorMessage});
}

class GetProgramPaymentMethodDetailsLoadingState
    extends ProgramsubscriptionplanState {}

class GetPlanSubscriptionSuccessState extends ProgramsubscriptionplanState {}

class GetPlanSubscriptionErrorState extends ProgramsubscriptionplanState {
  final String errorMessage;

  GetPlanSubscriptionErrorState({required this.errorMessage});
}

class GetPlansWithDetailsLoadingState extends ProgramsubscriptionplanState {}

class GetPlansWithDetailsSuccessState extends ProgramsubscriptionplanState {}

class GetPlansWithDetailsErrorState extends ProgramsubscriptionplanState {
  final String errorMessage;

  GetPlansWithDetailsErrorState({required this.errorMessage});
}

class GetPlanSubscriptionLoadingState extends ProgramsubscriptionplanState {}

class InitTabBarControllerState extends ProgramsubscriptionplanState {}

class ChangePackageIndexState extends ProgramsubscriptionplanState {}

class TypeControllerIndexState extends ProgramsubscriptionplanState {}

class ChangePlanIdState extends ProgramsubscriptionplanState {}
