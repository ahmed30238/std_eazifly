import 'package:eazifly_student/data/models/children/get_my_children_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetMyChildrenEntity {
  @JsonKey(name: "data")
  List<MyChildModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetMyChildrenEntity({this.data, this.status, this.message});
}

class MyChildEntity {
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

  @JsonKey(name: "bonus",fromJson: customInt)
  int? bonus;

  @JsonKey(name: "childrens")
  List<dynamic>? childrens;

  @JsonKey(name: "age",fromJson: customInt)
  int? age;

  @JsonKey(name: "token")
  String? token;

  @JsonKey(name: "is_guest")
  bool? isGuest;

  @JsonKey(name: "fcm_token")
  dynamic fcmToken;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "last_active_at")
  dynamic lastActiveAt;

  @JsonKey(name: "renew_data")
  dynamic renewData;

  @JsonKey(name: "status_label")
  ChildrenStatusLabelModel? statusLabel;

  @JsonKey(name: "programs")
  List<dynamic>? programs;

  @JsonKey(name: "chat_id")
  dynamic chatId;

  MyChildEntity({
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
    this.childrens,
    this.age,
    this.token,
    this.isGuest,
    this.fcmToken,
    this.createdAt,
    this.lastActiveAt,
    this.renewData,
    this.statusLabel,
    this.programs,
    this.chatId,
  });
}

class StatusLabelEntity {
  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "key")
  String? key;

  StatusLabelEntity({this.label, this.color, this.key});
}
