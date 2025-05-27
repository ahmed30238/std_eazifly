import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:json_annotation/json_annotation.dart';

class LoginEntity {
  @JsonKey(name: "data")
  DataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  LoginEntity({this.data, this.status, this.message});
}

class DataEntity {
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
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "whats_app")
  String? whatsApp;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "gender")
  String? gender;
  @JsonKey(name: "parent_name")
  dynamic parentName;
  @JsonKey(name: "user_coupon")
  String? userCoupon;
  @JsonKey(name: "bonus")
  String? bonus;
  @JsonKey(name: "age")
  String? age;
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "fcm_token")
  dynamic fcmToken;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "last_active_at")
  dynamic lastActiveAt;
  @JsonKey(name: "renew_data")
  dynamic renewData;
  @JsonKey(name: "status_label")
  StatusLabelModel? statusLabel;
  @JsonKey(name: "programs")
  List<ProgramModel>? programs;
  @JsonKey(name: "chat_id")
  dynamic chatId;

  DataEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.phone,
    this.whatsApp,
    this.image,
    this.gender,
    this.parentName,
    this.userCoupon,
    this.bonus,
    this.age,
    this.token,
    this.fcmToken,
    this.createdAt,
    this.lastActiveAt,
    this.renewData,
    this.statusLabel,
    this.programs,
    this.chatId,
  });
}

class ProgramEntity {
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  dynamic image;

  ProgramEntity({this.title, this.image});
}

class StatusLabelEntity {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "color")
  String? color;

  StatusLabelEntity({this.label, this.color});
}
