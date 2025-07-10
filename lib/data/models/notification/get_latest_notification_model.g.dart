// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_latest_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLatestNotificationModel _$GetLatestNotificationModelFromJson(
        Map<String, dynamic> json) =>
    GetLatestNotificationModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => GetLatestNotificationDatumModel.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetLatestNotificationModelToJson(
        GetLatestNotificationModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetLatestNotificationDatumModel _$GetLatestNotificationDatumModelFromJson(
        Map<String, dynamic> json) =>
    GetLatestNotificationDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..type = json['type'] as String?
      ..read = json['read'] as bool?
      ..title = json['title'] as String?
      ..message = json['message'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$GetLatestNotificationDatumModelToJson(
        GetLatestNotificationDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'read': instance.read,
      'title': instance.title,
      'message': instance.message,
      'created_at': instance.createdAt?.toIso8601String(),
    };
