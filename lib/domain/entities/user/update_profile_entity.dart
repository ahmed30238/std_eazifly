import 'package:eazifly_student/data/models/user/update_profile_model.dart';
import 'package:json_annotation/json_annotation.dart';

class UpdateProfileEntity {
  @JsonKey(name: "data")
  UpdateProfileDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  UpdateProfileEntity({this.data, this.status, this.message});
}

class UpdateProfileDataEntity {
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
  List<UpdateProfileDataModel>? childrens;

  @JsonKey(name: "age", fromJson: customInt)
  int? age;

  @JsonKey(name: "token")
  dynamic token;

  @JsonKey(name: "is_guest")
  dynamic isGuest;

  @JsonKey(name: "fcm_token")
  dynamic fcmToken;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "last_active_at")
  DateTime? lastActiveAt;

  @JsonKey(name: "renew_data")
  DateTime? renewData;

  @JsonKey(name: "instructor_assigned_data")
  dynamic instructorAssiignedData;

  @JsonKey(name: "status_label")
  UpdateProfileStatusLabelModel? statusLabel;

  @JsonKey(name: "programs")
  List<UpdateProfileProgramModel>? programs;

  @JsonKey(name: "chat_id", fromJson: customInt)
  int? chatId;

  UpdateProfileDataEntity({
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

class UpdateProfileProgramEntity {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;

  UpdateProfileProgramEntity({this.title, this.image});
}

class UpdateProfileStatusLabelEntity {
  String? label;
  String? color;
  String? key;

  UpdateProfileStatusLabelEntity({this.label, this.color, this.key});
}
