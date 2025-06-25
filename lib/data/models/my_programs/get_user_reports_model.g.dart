// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserReportsModel _$GetUserReportsModelFromJson(Map<String, dynamic> json) =>
    GetUserReportsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetUserReportsDatumModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetUserReportsModelToJson(
        GetUserReportsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };

GetUserReportsDatumModel _$GetUserReportsDatumModelFromJson(
        Map<String, dynamic> json) =>
    GetUserReportsDatumModel()
      ..reportMakerType = json['report_maker_type'] as String?
      ..reportMakerId = json['report_maker_id'] as String?
      ..reportMakerName = json['report_maker_name'] as String?
      ..reportMakerImage = json['report_maker_image'] as String?
      ..reportForType = json['report_for_type'] as String?
      ..reportForName = json['report_for_name'] as String?
      ..reportForId = json['report_for_id'] as String?
      ..reportForImage = json['report_for_image'] as String?
      ..program = json['program'] as String?
      ..meetingSessionId = json['meeting_session_id'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$GetUserReportsDatumModelToJson(
        GetUserReportsDatumModel instance) =>
    <String, dynamic>{
      'report_maker_type': instance.reportMakerType,
      'report_maker_id': instance.reportMakerId,
      'report_maker_name': instance.reportMakerName,
      'report_maker_image': instance.reportMakerImage,
      'report_for_type': instance.reportForType,
      'report_for_name': instance.reportForName,
      'report_for_id': instance.reportForId,
      'report_for_image': instance.reportForImage,
      'program': instance.program,
      'meeting_session_id': instance.meetingSessionId,
      'created_at': instance.createdAt?.toIso8601String(),
    };
