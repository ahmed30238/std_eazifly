abstract class ChangelecturerState {}

class ChangelecturerInitial extends ChangelecturerState {}

class ChooseChangeLecturerReasonState extends ChangelecturerState {}

class IncrementBodyIndexState extends ChangelecturerState {}

class DecrementBodyIndexState extends ChangelecturerState {}

class ToggleTimeTypeState extends ChangelecturerState {}

class ChangeSpecifiedDayState extends ChangelecturerState {}

class ChangeDateTypeIndexState extends ChangelecturerState {}

class ChangeSelectedStdentState extends ChangelecturerState {}

// Change Instructor States
class ChangeInstructorLoadingState extends ChangelecturerState {}

class ChangeInstructorSuccessState extends ChangelecturerState {}

class ChangeInstructorErrorState extends ChangelecturerState {
  final String errorMessage;
  ChangeInstructorErrorState({required this.errorMessage});
}

// Get User Subscription Data States
class GetUserSubscriptionDataLoadingState extends ChangelecturerState {}

class GetUserSubscriptionDataSuccessState extends ChangelecturerState {}

class GetUserSubscriptionDataErrorState extends ChangelecturerState {
  final String errorMessage;
  GetUserSubscriptionDataErrorState({required this.errorMessage});
}

class InitTabBarControllerState extends ChangelecturerState {}

class ChangeTapBarIndexState extends ChangelecturerState {}

class InitFixedTabBarControllerState extends ChangelecturerState {}

// Get Remaining Program Sessions States
class GetRemainingProgramSessionsLoadingState extends ChangelecturerState {}

class GetRemainingProgramSessionsSuccessState extends ChangelecturerState {}

class GetRemainingProgramSessionsErrorState extends ChangelecturerState {
  final String errorMessage;
  GetRemainingProgramSessionsErrorState({required this.errorMessage});
}

class GetInstructorsLoadingState extends ChangelecturerState {}

class ChangeChosenDaysState extends ChangelecturerState {}

class ChangeSelectedToTimeState extends ChangelecturerState {}

class ChangeSelectedFromTimeState extends ChangelecturerState {}

class ChangeSelectedTimeState extends ChangelecturerState {}

class ChangeLecturerIndexState extends ChangelecturerState {}

class GetInstructorsSuccessState extends ChangelecturerState {}

class GetInstructorsErrorState extends ChangelecturerState {
  final String message;
  GetInstructorsErrorState(this.message);
}
class GetChangeInstructorReasonsLoadingState extends ChangelecturerState {}

class GetChangeInstructorReasonsSuccessState extends ChangelecturerState {}

class GetChangeInstructorReasonsErrorState extends ChangelecturerState {
  final String message;
  GetChangeInstructorReasonsErrorState(this.message);
}
