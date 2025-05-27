abstract class ProgramdetailsState {}

class ProgramdetailsInitial extends ProgramdetailsState {}

class TabIndexState extends ProgramdetailsState {}

class GetProgramDetailsLoadingState extends ProgramdetailsState {}

class GetProgramDetailsSuccessState extends ProgramdetailsState {}

class GetProgramDetailsErrorState extends ProgramdetailsState {
  final String errorMessage;

  GetProgramDetailsErrorState({required this.errorMessage});
}
