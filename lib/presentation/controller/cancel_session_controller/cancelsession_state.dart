part of 'cancelsession_cubit.dart';

abstract class CancelSessionState {}

class CancelsessionInitial extends CancelSessionState {}

class ChangelecturerInitial extends CancelSessionState {}

class ChooseChangeLecturerReasonState extends CancelSessionState {}

class IncrementBodyIndexState extends CancelSessionState {}

class DecrementBodyIndexState extends CancelSessionState {}

class ToggleTimeTypeState extends CancelSessionState {}

class ChangeSpecifiedDayState extends CancelSessionState {}

class ChangeDateTypeIndexState extends CancelSessionState {}

class ChangeSelectedTimeState extends CancelSessionState {}

// Get Cancel Reasons States
class GetCancelReasonsLoadingState extends CancelSessionState {}

class GetCancelReasonsSuccessState extends CancelSessionState {}

class GetCancelReasonsErrorState extends CancelSessionState {
  final String message;
  GetCancelReasonsErrorState(this.message);
}

// Get Instructor Availabilities States
class GetInstructorAvailabilitiesLoadingState extends CancelSessionState {}

class GetInstructorAvailabilitiesSuccessState extends CancelSessionState {}

class GetInstructorAvailabilitiesErrorState extends CancelSessionState {
  final String message;
  GetInstructorAvailabilitiesErrorState(this.message);
}

// Change Session Date States
class ChangeSessionDateLoadingState extends CancelSessionState {}

class ChangeSessionDateSuccessState extends CancelSessionState {}

class ChangeSessionDateErrorState extends CancelSessionState {
  final String message;
  ChangeSessionDateErrorState(this.message);
}

// Post Cancel Session States
class PostCancelSessionLoadingState extends CancelSessionState {}

class PostCancelSessionSuccessState extends CancelSessionState {}

class PostCancelSessionErrorState extends CancelSessionState {
  final String message;
  PostCancelSessionErrorState(this.message);
}
