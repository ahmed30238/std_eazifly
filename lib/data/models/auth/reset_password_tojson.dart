class ResetPasswordToJson {
  final String email;
  final String code;
  final String password;
  final String passwordConfirmation;

  ResetPasswordToJson({
    required this.email,
    required this.code,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "code": code,
    "password": password,
    "password_confirmation": passwordConfirmation,
  };
}
