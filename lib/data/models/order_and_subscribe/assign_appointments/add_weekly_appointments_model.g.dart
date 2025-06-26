// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_weekly_appointments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddWeeklyAppontmentsModel _$AddWeeklyAppontmentsModelFromJson(
        Map<String, dynamic> json) =>
    AddWeeklyAppontmentsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => AddWeeklyAppontmentsDatumModel.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$AddWeeklyAppontmentsModelToJson(
        AddWeeklyAppontmentsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

AddWeeklyAppontmentsDatumModel _$AddWeeklyAppontmentsDatumModelFromJson(
        Map<String, dynamic> json) =>
    AddWeeklyAppontmentsDatumModel()
      ..start =
          json['start'] == null ? null : DateTime.parse(json['start'] as String)
      ..end =
          json['end'] == null ? null : DateTime.parse(json['end'] as String);

Map<String, dynamic> _$AddWeeklyAppontmentsDatumModelToJson(
        AddWeeklyAppontmentsDatumModel instance) =>
    <String, dynamic>{
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };
