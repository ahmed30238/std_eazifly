abstract class AccountdataState {}

class AccountdataInitial extends AccountdataState {}

class PickImageFromGallerySuccessState extends AccountdataState {}

class UpdateProfileLoadingState extends AccountdataState {}

class UpdateProfileSuccessState extends AccountdataState {}

class UpdateProfileErrorState extends AccountdataState {
  final String errorMessage;

  UpdateProfileErrorState({required this.errorMessage});
}
// Logout States
class LogoutLoadingState extends AccountdataState {}

class LogoutSuccessState extends AccountdataState {}

class LogoutErrorState extends AccountdataState {
  final String message;
  LogoutErrorState(this.message);
}