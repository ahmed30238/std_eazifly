import 'package:dio/dio.dart';

class CreateNewChildTojson {
  final String passwordConfirmation;
  final String userName;
  final String? image;
  final MultipartFile? imageFile;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String whatsApp;
  final String gender;
  final String password;
  final String age;

  CreateNewChildTojson({
    required this.passwordConfirmation,
    required this.userName,
    this.image,
    this.imageFile,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.whatsApp,
    required this.gender,
    required this.password,
    required this.age,
  });
  Map<String, dynamic> toJson() => {
        'password_confirmation': passwordConfirmation,
        'user_name': userName,
        "image": image,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'whats_app': whatsApp,
        'gender': gender,
        'password': password,
        'age': age,
      };
}
