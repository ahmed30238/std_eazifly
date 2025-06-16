abstract class MyProgramsState {}

class MyprogramsInitial extends MyProgramsState {}
class GetMyProgramsSuccessState extends MyProgramsState {}
class GetMyProgramsLoadingState extends MyProgramsState {}
class GetMyProgramsErrorState extends MyProgramsState {
  final String errorMessage;

  GetMyProgramsErrorState(this.errorMessage);
}


