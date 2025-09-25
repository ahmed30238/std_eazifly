part of 'grouppackagemanagement_cubit.dart';

abstract class GroupPackageManagementState {}

class GroupPackageManagementInitial extends GroupPackageManagementState {}

class ChangeChosenState extends GroupPackageManagementState {}

class ChangeStepperIndexState extends GroupPackageManagementState {}

class ToggleAddMySelfState extends GroupPackageManagementState {}

class GetMyChildrenLoadingState extends GroupPackageManagementState {}

class GetMyChildrenErrorState extends GroupPackageManagementState {
  final String errorMessage;

  GetMyChildrenErrorState({required this.errorMessage});
}

class GetMyChildrenSuccessState extends GroupPackageManagementState {}

// GetMyOrders States
class GetMyOrdersLoadingState extends GroupPackageManagementState {}

class GetMyOrdersSuccessState extends GroupPackageManagementState {
  GetMyOrdersSuccessState();
}

class GetMyOrdersErrorState extends GroupPackageManagementState {
  final String message;

  GetMyOrdersErrorState(this.message);
}

// AddWeeklyAppointments States
class AddWeeklyAppointmentsLoadingState extends GroupPackageManagementState {}

class AddWeeklyAppointmentsSuccessState extends GroupPackageManagementState {}

class AddWeeklyAppointmentsErrorState extends GroupPackageManagementState {
  final String message;

  AddWeeklyAppointmentsErrorState(this.message);
}

// CreateMeetingSessions States
class CreateMeetingSessionsLoadingState extends GroupPackageManagementState {}

class CreateMeetingSessionsSuccessState extends GroupPackageManagementState {}

class CreateMeetingSessionsErrorState extends GroupPackageManagementState {
  final String message;

  CreateMeetingSessionsErrorState(this.message);
}

// GetInstructors States
class GetInstructorsLoadingState extends GroupPackageManagementState {}

class GetInstructorsSuccessState extends GroupPackageManagementState {}

class GetInstructorsErrorState extends GroupPackageManagementState {
  final String message;

  GetInstructorsErrorState(this.message);
}

class SetappointmentsInitial extends GroupPackageManagementState {}

class ChangeTapBarIndexState extends GroupPackageManagementState {}

class InitTabBarControllerState extends GroupPackageManagementState {}

class ChangeChosenDaysState extends GroupPackageManagementState {}

class ChangeLecturerIndexState extends GroupPackageManagementState {}

class ChangeSpecifiedDayState extends GroupPackageManagementState {}

class InitFixedTabBarControllerState extends GroupPackageManagementState {}

class ChangeSelectedTimeState extends GroupPackageManagementState {}

class IncrementSelectedStudentndex extends GroupPackageManagementState {}

class ChangeSelectedFromTimeState extends GroupPackageManagementState {}

class ChangeSelectedToTimeState extends GroupPackageManagementState {}

class GetProgramContentLoadingState extends GroupPackageManagementState {}

class GetProgramContentSuccessState extends GroupPackageManagementState {}

class GetProgramContentErrorState extends GroupPackageManagementState {
  final String errorMessage;

  GetProgramContentErrorState({required this.errorMessage});
}

class FindInstructorSuccessState extends GroupPackageManagementState {}

class FindInstructorErrorState extends GroupPackageManagementState {
  final String errorMessage;

  FindInstructorErrorState({required this.errorMessage});
}

class FindInstructorLoadingState extends GroupPackageManagementState {}

class ChangeIsDoneAddedState extends GroupPackageManagementState {}

class AddUserSessionDateAndTimeLoadingState
    extends GroupPackageManagementState {}

class AddUserSessionDateAndTimeSuccessState
    extends GroupPackageManagementState {}

class AddUserSessionDateAndTimeErrorState extends GroupPackageManagementState {
  final String errorMessage;

  AddUserSessionDateAndTimeErrorState({required this.errorMessage});
}
