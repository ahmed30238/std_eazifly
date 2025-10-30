import 'package:json_annotation/json_annotation.dart';

class CompleteChapterLessonEntity {
  @JsonKey(name: "data")
  dynamic data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  CompleteChapterLessonEntity({this.data, this.status, this.message});
}
