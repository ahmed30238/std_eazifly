import 'package:eazifly_student/domain/entities/notification/read_notification_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'read_notification_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ReadNotificationModel extends ReadNotificationEntities {
  ReadNotificationModel();

  factory ReadNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$ReadNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReadNotificationModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReadNotificationDataModel extends ReadNotificationDataEntities {
  ReadNotificationDataModel();

  factory ReadNotificationDataModel.fromJson(Map<String, dynamic> json) =>
      _$ReadNotificationDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReadNotificationDataModelToJson(this);
}
