abstract class LoginState {}

class LoginInitial extends LoginState {}

class ChangePasswordVisibility extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailedState extends LoginState {}
