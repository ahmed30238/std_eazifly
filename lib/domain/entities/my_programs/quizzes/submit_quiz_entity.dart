import 'package:json_annotation/json_annotation.dart';

class SubmitQuizEntity {
  @JsonKey(name: "data")
  dynamic data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  SubmitQuizEntity({this.data, this.status, this.message});
}
