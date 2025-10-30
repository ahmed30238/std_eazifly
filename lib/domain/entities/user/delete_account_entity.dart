import 'package:json_annotation/json_annotation.dart';

class DeleteAccountEntity {
  @JsonKey(name: "data")
  dynamic data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  DeleteAccountEntity({this.data, this.status, this.message});
}
