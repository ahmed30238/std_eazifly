class LoginToJson {
  final String? phone;
  final String? email;
  final String? userName;
  final String password;

  const LoginToJson({
    this.phone,
    this.email,
    this.userName,
    required this.password,
  });

  // التحقق من وجود بيانات تسجيل دخول
  bool get isValid {
    return (phone?.trim().isNotEmpty == true) ||
        (email?.trim().isNotEmpty == true) ||
        (userName?.trim().isNotEmpty == true);
  }

  // الحصول على بيانات تسجيل الدخول
  MapEntry<String, String>? get loginCredential {
    // الأولوية: هاتف > إيميل > اسم مستخدم
    if (phone?.trim().isNotEmpty == true) {
      return MapEntry("phone", phone!.trim());
    }
    if (email?.trim().isNotEmpty == true) {
      return MapEntry("email", email!.trim());
    }
    if (userName?.trim().isNotEmpty == true) {
      return MapEntry("user_name", userName!.trim());
    }
    return null;
  }

  // تحويل إلى JSON
  Map<String, dynamic> toJson() {
    final credential = loginCredential;
    if (credential == null) {
      throw ArgumentError("يجب إدخال رقم الهاتف أو الإيميل أو اسم المستخدم");
    }

    return {
      credential.key: credential.value,
      "password": password,
    };
  }
}