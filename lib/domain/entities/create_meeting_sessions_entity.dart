import 'package:json_annotation/json_annotation.dart';

class CreateMeetingSessionsEntity {
  @JsonKey(name: "data")
  dynamic data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  CreateMeetingSessionsEntity({this.data, this.status, this.message});
}
