class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterFailedState extends RegisterState {
  final String message;

  RegisterFailedState(this.message);
}

class RegisterValidationErrorState extends RegisterState {
  final String message;

  RegisterValidationErrorState(this.message);
}

class GenderChangedState extends RegisterState {
  final String selectedGender;

  GenderChangedState(this.selectedGender);
}
