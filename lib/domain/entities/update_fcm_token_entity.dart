import 'package:json_annotation/json_annotation.dart';

class UpdateFcmTokenEntity {
  @JsonKey(name: "data")
  dynamic data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  UpdateFcmTokenEntity({this.data, this.status, this.message});
}
