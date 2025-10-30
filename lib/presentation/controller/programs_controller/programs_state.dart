abstract class ProgramsState {}

class ProgramsInitial extends ProgramsState {}

class GetProgramsLoadingState extends ProgramsState {}

class GetProgramsSuccessState extends ProgramsState {}

class GetProgramsErrorState extends ProgramsState {
  final String errorMessage;

  GetProgramsErrorState({required this.errorMessage});
}
