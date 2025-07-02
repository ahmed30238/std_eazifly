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

// Get Remaining Program Sessions States
class GetRemainingProgramSessionsLoadingState extends ChangelecturerState {}

class GetRemainingProgramSessionsSuccessState extends ChangelecturerState {}

class GetRemainingProgramSessionsErrorState extends ChangelecturerState {
  final String errorMessage;
  GetRemainingProgramSessionsErrorState({required this.errorMessage});
}
