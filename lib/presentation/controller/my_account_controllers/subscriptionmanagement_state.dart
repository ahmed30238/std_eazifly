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

class RenewSubscriptionLoadingState extends SubscriptionmanagementState {}

class RenewSubscriptionSuccessState extends SubscriptionmanagementState {}

class RenewSubscriptionErrorState extends SubscriptionmanagementState {
  final String errorMessage;
  final int? errorCode;

  RenewSubscriptionErrorState({
    required this.errorMessage,
    this.errorCode,
  });
}

class GetGalleryImagesState extends SubscriptionmanagementState {}

class ShowPlanLoadingState extends SubscriptionmanagementState {}

class ShowPlanSuccessState extends SubscriptionmanagementState {}

class ShowPlanErrorState extends SubscriptionmanagementState {
  final String errorMessage;

  ShowPlanErrorState({
    required this.errorMessage,
  });
}
