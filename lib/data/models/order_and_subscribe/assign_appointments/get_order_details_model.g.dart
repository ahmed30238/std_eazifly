// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOrderDetailsModel _$GetOrderDetailsModelFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetailsModel()
      ..data = json['data'] == null
          ? null
          : GetOrderDetailsDataModel.fromJson(
              json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetOrderDetailsModelToJson(
        GetOrderDetailsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

GetOrderDetailsDataModel _$GetOrderDetailsDataModelFromJson(
        Map<String, dynamic> json) =>
    GetOrderDetailsDataModel()
      ..subscripeDays = json['subscripe_days'] as String?
      ..duration = json['duration'] as String?
      ..numberOfSessionPerWeek = json['number_of_session_per_week'] as String?
      ..startDate = json['start_date']
      ..numberOfSessions = (json['number_of_sessions'] as num?)?.toInt()
      ..programIds = (json['program_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$GetOrderDetailsDataModelToJson(
        GetOrderDetailsDataModel instance) =>
    <String, dynamic>{
      'subscripe_days': instance.subscripeDays,
      'duration': instance.duration,
      'number_of_session_per_week': instance.numberOfSessionPerWeek,
      'start_date': instance.startDate,
      'number_of_sessions': instance.numberOfSessions,
      'program_ids': instance.programIds,
    };
