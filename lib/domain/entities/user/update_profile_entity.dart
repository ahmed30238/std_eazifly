import 'package:eazifly_student/data/models/user/update_profile_model.dart';
import 'package:json_annotation/json_annotation.dart';

class UpdateProfileEntity {
  @JsonKey(name: "data")
  UpdateProfileDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  UpdateProfileEntity({
    this.data,
    this.status,
    this.message,
  });
}

class UpdateProfileDataEntity {
  int? id;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? parentId;
  String? phone;
  String? whatsApp;
  String? image;
  String? gender;
  String? parentName;
  String? userCoupon;
  String? bonus;
  List<UpdateProfileDataModel>? childrens;
  String? age;
  dynamic token;
  dynamic isGuest;
  dynamic fcmToken;
  DateTime? createdAt;
  DateTime? lastActiveAt;
  DateTime? renewData;
  dynamic instructorAssiignedData;
  UpdateProfileStatusLabelModel? statusLabel;
  List<UpdateProfileProgramModel>? programs;
  dynamic chatId;

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

  UpdateProfileProgramEntity({
    this.title,
    this.image,
  });
}

class UpdateProfileStatusLabelEntity {
  String? label;
  String? color;
  String? key;

  UpdateProfileStatusLabelEntity({
    this.label,
    this.color,
    this.key,
  });
}
