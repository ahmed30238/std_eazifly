import 'package:eazifly_student/data/models/notification/get_latest_notification_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetLatestNotificationsEntities {
  @JsonKey(name: "data")
  List<GetLatestNotificationDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  GetLatestNotificationsEntities({
    this.data,
    this.status,
    this.message,
  });
}

class GetLatestNotificationDatumEntities {
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
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  GetLatestNotificationDatumEntities({
    this.id,
    this.type,
    this.read,
    this.title,
    this.message,
    this.createdAt,
  });
}
