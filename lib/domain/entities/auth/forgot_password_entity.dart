import 'package:json_annotation/json_annotation.dart';

class ForgotPasswordEntity {
  @JsonKey(name: "data")
  dynamic data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  ForgotPasswordEntity({this.data, this.status, this.message});
}
