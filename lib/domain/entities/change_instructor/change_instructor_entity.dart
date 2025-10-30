import 'package:json_annotation/json_annotation.dart';

class ChangeInstructorEntity {
  @JsonKey(name: "data")
  dynamic data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  ChangeInstructorEntity({this.data, this.status, this.message});
}
