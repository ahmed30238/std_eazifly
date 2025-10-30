import 'package:json_annotation/json_annotation.dart';

import '../../../data/models/auth/register_model.dart';

class RegisterEntity {
  @JsonKey(name: "data")
  RegisterDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  RegisterEntity({this.data, this.status, this.message});
}

class RegisterDataEntity {
  static int? customInt(val) => int.tryParse(val?.toString() ?? "");
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "first_name")
  String? firstName;
  @JsonKey(name: "last_name")
  String? lastName;
  @JsonKey(name: "user_name")
  String? userName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "parent_id", fromJson: customInt)
  int? parentId;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "whats_app")
  String? whatsApp;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "parent_name")
  String? parentName;
  @JsonKey(name: "user_coupon")
  String? userCoupon;
  @JsonKey(name: "bonus", fromJson: customInt)
  int? bonus;
  @JsonKey(name: "childrens")
  List<dynamic>? childrens;
  @JsonKey(name: "age", fromJson: customInt)
  int? age;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "is_guest")
  bool? isGuest;
  @JsonKey(name: "fcm_token")
  String? fcmToken;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "last_active_at")
  dynamic lastActiveAt;
  @JsonKey(name: "renew_data")
  dynamic renewData;
  @JsonKey(name: "instructor_assiigned_data")
  dynamic instructorAssiignedData;
  @JsonKey(name: "status_label")
  RegisterStatusLabelModel? statusLabel;
  @JsonKey(name: "programs")
  List<dynamic>? programs;
  @JsonKey(name: "chat_id", fromJson: customInt)
  int? chatId;

  RegisterDataEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.parentId,
    this.phone,
    this.whatsApp,
    this.image,
    this.gender,
    this.parentName,
    this.userCoupon,
    this.bonus,
    this.childrens,
    this.age,
    this.token,
    this.isGuest,
    this.fcmToken,
    this.createdAt,
    this.lastActiveAt,
    this.renewData,
    this.instructorAssiignedData,
    this.statusLabel,
    this.programs,
    this.chatId,
  });
}

class RegisterStatusLabelEntity {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "key")
  String? key;

  RegisterStatusLabelEntity({this.label, this.color, this.key});
}
