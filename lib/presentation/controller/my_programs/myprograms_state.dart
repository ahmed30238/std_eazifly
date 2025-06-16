abstract class MyProgramsState {}

class MyprogramsInitial extends MyProgramsState {}

class GetMyProgramsSuccessState extends MyProgramsState {}

class GetMyProgramsLoadingState extends MyProgramsState {}

class GetMyProgramsErrorState extends MyProgramsState {
  final String errorMessage;

  GetMyProgramsErrorState(this.errorMessage);
}

class JoinSessionSuccessState extends MyProgramsState {}

class JoinSessionLoadingState extends MyProgramsState {}

class JoinSessionErrorState extends MyProgramsState {
  final String errorMessage;

  JoinSessionErrorState(this.errorMessage);
}

class GetAssignedChildrenSuccessState extends MyProgramsState {}

class GetAssignedChildrenLoadingState extends MyProgramsState {}

class GetAssignedChildrenErrorState extends MyProgramsState {
  final String errorMessage;

  GetAssignedChildrenErrorState(this.errorMessage);
}
