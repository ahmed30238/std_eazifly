import 'package:eazifly_student/data/models/home/get_home_quizzes_model.dart';
import 'package:json_annotation/json_annotation.dart';


class GetHomeQuizzesEntity {
  @JsonKey(name: "data")
  List<GetHomeQuizzesDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetHomeQuizzesEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetHomeQuizzesDatumEntity {
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

  GetHomeQuizzesDatumEntity({
    this.id,
    this.title,
    this.createdAt,
    this.status,
    this.fullMark,
    this.totalMark,
  });
}
