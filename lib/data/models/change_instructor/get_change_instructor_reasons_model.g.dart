// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_change_instructor_reasons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChangeInstructorReasonsModel _$GetChangeInstructorReasonsModelFromJson(
        Map<String, dynamic> json) =>
    GetChangeInstructorReasonsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => GetChangeInstructorReasonsDatumModel.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetChangeInstructorReasonsModelToJson(
        GetChangeInstructorReasonsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetChangeInstructorReasonsDatumModel
    _$GetChangeInstructorReasonsDatumModelFromJson(Map<String, dynamic> json) =>
        GetChangeInstructorReasonsDatumModel()
          ..id = (json['id'] as num?)?.toInt()
          ..title = json['title'] as String?;

Map<String, dynamic> _$GetChangeInstructorReasonsDatumModelToJson(
        GetChangeInstructorReasonsDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
