import 'package:eazifly_student/data/models/notification/read_notification_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ReadNotificationEntities {
  @JsonKey(name: "data")
  ReadNotificationDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  ReadNotificationEntities({this.data, this.status, this.message});
}

class ReadNotificationDataEntities {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "read")
  bool? read;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "message")
  String? message;
  ReadNotificationDataEntities({
    this.id,
    this.type,
    this.read,
    this.title,
    this.message,
  });
}
