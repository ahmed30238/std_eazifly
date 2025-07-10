import 'package:eazifly_student/domain/entities/notification/get_latest_notifications_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_latest_notification_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetLatestNotificationModel extends GetLatestNotificationsEntities {
  GetLatestNotificationModel();

  factory GetLatestNotificationModel.fromJson(Map<String, dynamic> json) =>
      _$GetLatestNotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetLatestNotificationModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetLatestNotificationDatumModel
    extends GetLatestNotificationDatumEntities {
  GetLatestNotificationDatumModel();

  factory GetLatestNotificationDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetLatestNotificationDatumModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetLatestNotificationDatumModelToJson(this);
}
