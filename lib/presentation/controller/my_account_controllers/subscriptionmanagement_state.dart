abstract class SubscriptionmanagementState {}

class SubscriptionmanagementInitial extends SubscriptionmanagementState {}

class ChangeTapBarIndexState extends SubscriptionmanagementState {}

class InitTabBarControllerState extends SubscriptionmanagementState {}

// Library Subscription States
class GetLibrarySubscriptionLoadingState extends SubscriptionmanagementState {}

class GetLibrarySubscriptionSuccessState extends SubscriptionmanagementState {}

class GetLibrarySubscriptionErrorState extends SubscriptionmanagementState {
  final String errorMessage;
  GetLibrarySubscriptionErrorState({required this.errorMessage});
}

// Program Subscription States
class GetProgramSubscriptionLoadingState extends SubscriptionmanagementState {}

class GetProgramSubscriptionSuccessState extends SubscriptionmanagementState {}

class GetProgramSubscriptionErrorState extends SubscriptionmanagementState {
  final String errorMessage;
  GetProgramSubscriptionErrorState({required this.errorMessage});
}

class CancelSubscriptionLoadingState extends SubscriptionmanagementState {}

class PickImageFromGallerySuccessState extends SubscriptionmanagementState {}

class CancelSubscriptionSuccessState extends SubscriptionmanagementState {}

class CancelSubscriptionErrorState extends SubscriptionmanagementState {
  final String errorMessage;
  CancelSubscriptionErrorState({required this.errorMessage});
}

class UpgradeOrderLoadingState extends SubscriptionmanagementState {}

class UpgradeOrderSuccessState extends SubscriptionmanagementState {}

class UpgradeOrderErrorState extends SubscriptionmanagementState {
  final String errorMessage;
  UpgradeOrderErrorState({required this.errorMessage});
}

class RenewSubscriptionLoadingState extends SubscriptionmanagementState {}

class RenewSubscriptionSuccessState extends SubscriptionmanagementState {}

class RenewSubscriptionErrorState extends SubscriptionmanagementState {
  final String errorMessage;
  final int? errorCode;

  RenewSubscriptionErrorState({required this.errorMessage, this.errorCode});
}

class GetGalleryImagesState extends SubscriptionmanagementState {}

class ShowPlanLoadingState extends SubscriptionmanagementState {}

class ShowPlanSuccessState extends SubscriptionmanagementState {}

class ShowPlanErrorState extends SubscriptionmanagementState {
  final String errorMessage;

  ShowPlanErrorState({required this.errorMessage});
}

class ProgramsubscriptionplanInitial extends SubscriptionmanagementState {}

class ChangePlanIndexState extends SubscriptionmanagementState {}

class ChangeLessonDurationIndexState extends SubscriptionmanagementState {}

class GetPlansLoadingState extends SubscriptionmanagementState {}

class GetPlansErrorState extends SubscriptionmanagementState {
  final String errorMessage;

  GetPlansErrorState({required this.errorMessage});
}

class GetPlansSuccessState extends SubscriptionmanagementState {}

class FilterPlansLoadingState extends SubscriptionmanagementState {}

class FilterPlansErrorState extends SubscriptionmanagementState {
  final String errorMessage;

  FilterPlansErrorState({required this.errorMessage});
}

class FilterPlansSuccessState extends SubscriptionmanagementState {}

class CreateOrderLoadingState extends SubscriptionmanagementState {}

class UpdateStartDateState extends SubscriptionmanagementState {}

class CreateOrderErrorState extends SubscriptionmanagementState {
  final String errorMessage;

  CreateOrderErrorState({required this.errorMessage});
}

class CreateOrderSuccessState extends SubscriptionmanagementState {}

class CheckCopounLoadingState extends SubscriptionmanagementState {}

class CheckCopounErrorState extends SubscriptionmanagementState {
  final String errorMessage;

  CheckCopounErrorState({required this.errorMessage});
}

class CheckCopounSuccessState extends SubscriptionmanagementState {}

class GetProgramPaymentMethodDetailsSuccessState
    extends SubscriptionmanagementState {}

class GetProgramPaymentMethodDetailsErrorState
    extends SubscriptionmanagementState {
  final String errorMessage;

  GetProgramPaymentMethodDetailsErrorState({required this.errorMessage});
}

class GetProgramPaymentMethodDetailsLoadingState
    extends SubscriptionmanagementState {}

class GetPlanSubscriptionSuccessState extends SubscriptionmanagementState {}

class GetPlanSubscriptionErrorState extends SubscriptionmanagementState {
  final String errorMessage;

  GetPlanSubscriptionErrorState({required this.errorMessage});
}

class GetPlansWithDetailsLoadingState extends SubscriptionmanagementState {}

class GetPlansWithDetailsSuccessState extends SubscriptionmanagementState {}

class GetPlansWithDetailsErrorState extends SubscriptionmanagementState {
  final String errorMessage;

  GetPlansWithDetailsErrorState({required this.errorMessage});
}

class GetPlanSubscriptionLoadingState extends SubscriptionmanagementState {}

class ChangePackageIndexState extends SubscriptionmanagementState {}

class TypeControllerIndexState extends SubscriptionmanagementState {}

class ChangePlanIdState extends SubscriptionmanagementState {}
