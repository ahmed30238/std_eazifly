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