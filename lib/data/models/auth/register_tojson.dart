class RegisterToJson {
  final String firstName;
  final String lastName;
  final String email;
  final String? phone;
  final String? whatsApp;
  final String gender;
  final String password;
  final String userName;
  final String passwordConfirmation;

  RegisterToJson({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.whatsApp,
    required this.gender,
    required this.password,
    required this.userName,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "whats_app": whatsApp,
    "gender": gender,
    "password": password,
    "user_name": userName,
    "password_confirmation": passwordConfirmation,
  };
}
