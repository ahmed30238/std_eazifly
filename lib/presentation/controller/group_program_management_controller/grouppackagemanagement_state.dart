part of 'grouppackagemanagement_cubit.dart';

abstract class GrouppackagemanagementState {}

class GrouppackagemanagementInitial extends GrouppackagemanagementState {}

class ChangeChosenState extends GrouppackagemanagementState {}

class ChangeStepperIndexState extends GrouppackagemanagementState {}

class ToggleAddMySelfState extends GrouppackagemanagementState {}

class GetMyChildernLoadingState extends GrouppackagemanagementState {}

class GetMyChildernErrorState extends GrouppackagemanagementState {
  final String errorMessage;

  GetMyChildernErrorState({required this.errorMessage});
}

class GetMyChildernSuccessState extends GrouppackagemanagementState {}

// GetMyOrders States
class GetMyOrdersLoadingState extends GrouppackagemanagementState {}

class GetMyOrdersSuccessState extends GrouppackagemanagementState {
  GetMyOrdersSuccessState();
}

class GetMyOrdersErrorState extends GrouppackagemanagementState {
  final String message;
  GetMyOrdersErrorState(this.message);
}

// AddWeeklyAppointments States
class AddWeeklyAppointmentsLoadingState extends GrouppackagemanagementState {}

class AddWeeklyAppointmentsSuccessState extends GrouppackagemanagementState {}

class AddWeeklyAppointmentsErrorState extends GrouppackagemanagementState {
  final String message;
  AddWeeklyAppointmentsErrorState(this.message);
}

// CreateMeetingSessions States
class CreateMeetingSessionsLoadingState extends GrouppackagemanagementState {}

class CreateMeetingSessionsSuccessState extends GrouppackagemanagementState {}

class CreateMeetingSessionsErrorState extends GrouppackagemanagementState {
  final String message;
  CreateMeetingSessionsErrorState(this.message);
}

// GetInstructors States
class GetInstructorsLoadingState extends GrouppackagemanagementState {}

class GetInstructorsSuccessState extends GrouppackagemanagementState {
}

class GetInstructorsErrorState extends GrouppackagemanagementState {
  final String message;
  GetInstructorsErrorState(this.message);
}

class SetappointmentsInitial extends GrouppackagemanagementState {}

class ChangeTapBarIndexState extends GrouppackagemanagementState {}

class InitTabBarControllerState extends GrouppackagemanagementState {}

class ChangeChosenDaysState extends GrouppackagemanagementState {}

class ChangeLecturerIndexState extends GrouppackagemanagementState {}

class ChangeSpecifiedDayState extends GrouppackagemanagementState {}

class InitFixedTabBarControllerState extends GrouppackagemanagementState {}

class ChangeSelectedTimeState extends GrouppackagemanagementState {}

class IncrementSelectedStudentndex extends GrouppackagemanagementState {}

class ChangeSelectedFromTimeState extends GrouppackagemanagementState {}

class ChangeSelectedToTimeState extends GrouppackagemanagementState {}

class GetProgramContentLoadingState extends GrouppackagemanagementState {}

class GetProgramContentSuccessState extends GrouppackagemanagementState {}

class GetProgramContentErrorState extends GrouppackagemanagementState {
  final String errorMessage;

  GetProgramContentErrorState({
    required this.errorMessage,
  });
}
