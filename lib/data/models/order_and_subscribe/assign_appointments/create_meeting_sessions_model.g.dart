// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_meeting_sessions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMeetingSessionsModel _$CreateMeetingSessionsModelFromJson(
  Map<String, dynamic> json,
) => CreateMeetingSessionsModel()
  ..data = json['data']
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$CreateMeetingSessionsModelToJson(
  CreateMeetingSessionsModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'status': instance.status,
  'message': instance.message,
};
