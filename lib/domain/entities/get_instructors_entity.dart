import 'package:eazifly_student/data/models/order_and_subscribe/get_instructors_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetInstructorsEntity {
  @JsonKey(name: "data")
  List<GetInstructorsInstructorModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetInstructorsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetInstructorsInstructorEntity {
  static int? customInt(val) {
    return int.tryParse(val?.toString() ?? "");
  }

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name_en")
  String? nameEn;

  @JsonKey(name: "name_ar")
  String? nameAr;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "whats_app")
  String? whatsApp;

  @JsonKey(name: "address")
  String? address;

  @JsonKey(name: "age", fromJson: customInt)
  int? age;

  @JsonKey(name: "gender")
  String? gender;

  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "specializations")
  List<GetInstructorsInstructorSpecializationsModel>? specializations;

  GetInstructorsInstructorEntity({
    this.id,
    this.nameEn,
    this.nameAr,
    this.phone,
    this.whatsApp,
    this.address,
    this.age,
    this.gender,
    this.image,
    this.specializations,
  });
}

class GetInstructorsInstructorSpecializationsEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  GetInstructorsInstructorSpecializationsEntity({
    this.id,
    this.name,
  });
}
