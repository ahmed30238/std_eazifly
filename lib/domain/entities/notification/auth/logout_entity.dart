import 'package:json_annotation/json_annotation.dart';

class LogoutEntity {
  @JsonKey(name: "data")
  dynamic data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  LogoutEntity({this.data, this.status, this.message});
}
