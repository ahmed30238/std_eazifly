abstract class ChildrenState {}

class ChildrenInitial extends ChildrenState {}

class GetMyChildernLoadingState extends ChildrenState {}

class GetMyChildernErrorState extends ChildrenState {
  final String errorMessage;

  GetMyChildernErrorState({required this.errorMessage});
}

class GetMyChildernSuccessState extends ChildrenState {}

class ChangeChosenState extends ChildrenState {}
