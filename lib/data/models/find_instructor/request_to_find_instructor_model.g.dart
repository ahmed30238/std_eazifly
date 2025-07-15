// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_to_find_instructor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestToFindInstructorModel _$RequestToFindInstructorModelFromJson(
        Map<String, dynamic> json) =>
    RequestToFindInstructorModel()
      ..data = json['data']
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$RequestToFindInstructorModelToJson(
        RequestToFindInstructorModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
