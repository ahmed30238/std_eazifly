class UpdateProfileTojson {
  final String age;
  final String whatsApp;
  final String gender;
  final String email;
  final String phone;
  final String userName;
  final String firstName;
  final String lastName;
  final String parentId;
  final String? image; // للمسار
  // final MultipartFile? imageFile; // للـ MultipartFile المباشر

  UpdateProfileTojson({
    required this.age,
    required this.parentId,
    required this.whatsApp,
    required this.gender,
    required this.email,
    required this.phone,
    required this.userName,
    required this.firstName,
    required this.lastName,
    this.image,
    // this.imageFile,
  });
  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'whats_app': whatsApp,
      'gender': gender,
      'email': email,
      'phone': phone,
      'user_name': userName,
      'fist_name': firstName,
      'last_name': lastName,
      'image': image,
      "parent_id": parentId,
    };
  }
}

/*
age,
whats_app,
address,
email,
phone,
reason,
image,
image,
name_en,
name_ar
 */
