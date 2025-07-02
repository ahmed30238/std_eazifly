// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_remaining_program_sessions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRemainingProgramSessionsModel _$GetRemainingProgramSessionsModelFromJson(
        Map<String, dynamic> json) =>
    GetRemainingProgramSessionsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => GetRemainigProgramSessionsDatumModel.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetRemainingProgramSessionsModelToJson(
        GetRemainingProgramSessionsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetRemainigProgramSessionsDatumModel
    _$GetRemainigProgramSessionsDatumModelFromJson(Map<String, dynamic> json) =>
        GetRemainigProgramSessionsDatumModel()
          ..id = (json['id'] as num?)?.toInt()
          ..start = json['start'] == null
              ? null
              : DateTime.parse(json['start'] as String)
          ..end = json['end'] == null
              ? null
              : DateTime.parse(json['end'] as String);

Map<String, dynamic> _$GetRemainigProgramSessionsDatumModelToJson(
        GetRemainigProgramSessionsDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };
