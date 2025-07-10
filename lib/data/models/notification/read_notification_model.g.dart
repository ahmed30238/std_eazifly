// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadNotificationModel _$ReadNotificationModelFromJson(
        Map<String, dynamic> json) =>
    ReadNotificationModel()
      ..data = json['data'] == null
          ? null
          : ReadNotificationDataModel.fromJson(
              json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$ReadNotificationModelToJson(
        ReadNotificationModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

ReadNotificationDataModel _$ReadNotificationDataModelFromJson(
        Map<String, dynamic> json) =>
    ReadNotificationDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..type = json['type'] as String?
      ..read = json['read'] as bool?
      ..title = json['title'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ReadNotificationDataModelToJson(
        ReadNotificationDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'read': instance.read,
      'title': instance.title,
      'message': instance.message,
    };
