class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

// Forgot Password States
final class ForgotPasswordLoadingState extends ForgotPasswordState {}

final class ForgotPasswordSuccessState extends ForgotPasswordState {}

final class ForgotPasswordErrorState extends ForgotPasswordState {
  final String errorMessage;

  ForgotPasswordErrorState({required this.errorMessage});
}

// Reset Password States
final class ResetPasswordLoadingState extends ForgotPasswordState {}

final class ResetPasswordSuccessState extends ForgotPasswordState {}

final class ResetPasswordErrorState extends ForgotPasswordState {
  final String errorMessage;

  ResetPasswordErrorState({required this.errorMessage});
}
final class PasswordVisibilityChangedState extends ForgotPasswordState {}