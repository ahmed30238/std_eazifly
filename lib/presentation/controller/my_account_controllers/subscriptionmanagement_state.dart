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
