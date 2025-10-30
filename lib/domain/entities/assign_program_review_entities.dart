import 'package:eazifly_student/data/models/programs/assign_program_review_model.dart';
import 'package:json_annotation/json_annotation.dart';

class AssignProgramReviewEntity {
  @JsonKey(name: "data")
  AssignProgramReviewDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  AssignProgramReviewEntity({this.data, this.status, this.message});
}

class AssignProgramReviewDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "program")
  String? program;

  @JsonKey(name: "user")
  String? user;

  @JsonKey(name: "user_image")
  String? userImage;

  @JsonKey(name: "rating")
  int? rating;

  @JsonKey(name: "review")
  String? review;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  AssignProgramReviewDataEntity({
    this.id,
    this.program,
    this.user,
    this.userImage,
    this.rating,
    this.review,
    this.createdAt,
  });
}
