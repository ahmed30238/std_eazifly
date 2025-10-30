import 'package:json_annotation/json_annotation.dart';

class RequestToFindInstructorEntity {
  @JsonKey(name: "data")
  dynamic data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  RequestToFindInstructorEntity({this.data, this.status, this.message});
}
