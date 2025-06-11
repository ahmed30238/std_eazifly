abstract class ChildrenState {}

class ChildrenInitial extends ChildrenState {}

class GetMyChildernLoadingState extends ChildrenState {}

class GetMyChildernErrorState extends ChildrenState {
  final String errorMessage;

  GetMyChildernErrorState({required this.errorMessage});
}

class GetMyChildernSuccessState extends ChildrenState {}

class PickImageFromGallerySuccessState extends ChildrenState {}

class CreateNewChildErrorState extends ChildrenState {
  final String errorMessage;

  CreateNewChildErrorState({required this.errorMessage});
}

class CreateNewChildLoadingState extends ChildrenState {}

class CreateNewChildSuccessState extends ChildrenState {}
