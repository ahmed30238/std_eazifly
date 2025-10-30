import 'package:eazifly_student/data/models/my_programs/quizzes/get_user_quizzes_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetUserQuizzesEntity {
  @JsonKey(name: "data")
  List<GetUserQuizzesDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetUserQuizzesEntity({this.data, this.status, this.message});
}

class GetUserQuizzesDatumEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "full_mark")
  String? fullMark;

  @JsonKey(name: "total_mark")
  String? totalMark;

  GetUserQuizzesDatumEntity({
    this.id,
    this.title,
    this.createdAt,
    this.status,
    this.fullMark,
    this.totalMark,
  });
}
