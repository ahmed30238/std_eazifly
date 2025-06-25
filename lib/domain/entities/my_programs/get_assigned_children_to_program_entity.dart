import 'package:eazifly_student/data/models/my_programs/get_assigned_children_to_program_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetAssignedChildrenToProgramEntity {
  @JsonKey(name: "data")
  List<GetAssignedChildrenToProgramDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetAssignedChildrenToProgramEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetAssignedChildrenToProgramDatumEntity {
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

  @JsonKey(name: "parent_id")
  String? parentId;

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

  @JsonKey(name: "bonus")
  String? bonus;

  @JsonKey(name: "childrens")
  List<dynamic>? childrens;

  @JsonKey(name: "age")
  String? age;

  @JsonKey(name: "token")
  dynamic token;

  @JsonKey(name: "is_guest")
  dynamic isGuest;

  @JsonKey(name: "fcm_token")
  dynamic fcmToken;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "last_active_at")
  dynamic lastActiveAt;

  @JsonKey(name: "renew_data")
  DateTime? renewData;

  @JsonKey(name: "status_label")
  GetAssignedChildrenToProgramStatusLabelModel? statusLabel;

  @JsonKey(name: "programs")
  List<GetAssignedChildrenToProgramProgramModel>? programs;

  @JsonKey(name: "chat_id")
  dynamic chatId;

  GetAssignedChildrenToProgramDatumEntity({
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
    this.statusLabel,
    this.programs,
    this.chatId,
  });
}

class GetAssignedChildrenToProgramProgramEntity {
  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "image")
  String? image;

  GetAssignedChildrenToProgramProgramEntity({
    this.title,
    this.image,
  });
}

class GetAssignedChildrenToProgramStatusLabelEntity {
  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "color")
  String? color;

  GetAssignedChildrenToProgramStatusLabelEntity({
    this.label,
    this.color,
  });
}