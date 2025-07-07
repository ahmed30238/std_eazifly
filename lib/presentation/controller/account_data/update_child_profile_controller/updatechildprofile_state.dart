abstract class UpdatechildprofileState {}

class UpdatechildprofileInitial extends UpdatechildprofileState {}

class PickImageFromGallerySuccessState extends UpdatechildprofileState {}

class UpdateProfileLoadingState extends UpdatechildprofileState {}

class UpdateProfileSuccessState extends UpdatechildprofileState {}

class UpdateProfileErrorState extends UpdatechildprofileState {
  final String errorMessage;

  UpdateProfileErrorState({required this.errorMessage});
}
