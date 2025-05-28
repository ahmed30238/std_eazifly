// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlansModel _$GetPlansModelFromJson(Map<String, dynamic> json) =>
    GetPlansModel()
      ..data = json['data'] == null
          ? null
          : GetPlansDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetPlansModelToJson(GetPlansModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

GetPlansDataModel _$GetPlansDataModelFromJson(Map<String, dynamic> json) =>
    GetPlansDataModel()
      ..numberOfSessionPerWeek =
          (json['number_of_session_per_week'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList()
      ..duration =
          (json['duration'] as List<dynamic>?)?.map((e) => e as String).toList()
      ..subscripeDays = (json['subscripe_days'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$GetPlansDataModelToJson(GetPlansDataModel instance) =>
    <String, dynamic>{
      'number_of_session_per_week': instance.numberOfSessionPerWeek,
      'duration': instance.duration,
      'subscripe_days': instance.subscripeDays,
    };
