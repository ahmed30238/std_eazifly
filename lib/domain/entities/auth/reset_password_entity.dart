import 'package:json_annotation/json_annotation.dart';

class ResetPasswordEntity {
  @JsonKey(name: "data")
  dynamic data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  ResetPasswordEntity({this.data, this.status, this.message});
}
