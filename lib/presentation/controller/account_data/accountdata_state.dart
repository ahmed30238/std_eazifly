abstract class AccountdataState {}

class AccountdataInitial extends AccountdataState {}

class PickImageFromGallerySuccessState extends AccountdataState {}

class UpdateProfileLoadingState extends AccountdataState {}

class UpdateProfileSuccessState extends AccountdataState {}

class UpdateProfileErrorState extends AccountdataState {
  final String errorMessage;

  UpdateProfileErrorState({required this.errorMessage});
}
