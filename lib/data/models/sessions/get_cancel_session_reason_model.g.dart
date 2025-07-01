// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cancel_session_reason_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCancelSessionReasonModel _$GetCancelSessionReasonModelFromJson(
        Map<String, dynamic> json) =>
    GetCancelSessionReasonModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => GetCancelSessionReasonDatumModel.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetCancelSessionReasonModelToJson(
        GetCancelSessionReasonModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetCancelSessionReasonDatumModel _$GetCancelSessionReasonDatumModelFromJson(
        Map<String, dynamic> json) =>
    GetCancelSessionReasonDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?;

Map<String, dynamic> _$GetCancelSessionReasonDatumModelToJson(
        GetCancelSessionReasonDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
