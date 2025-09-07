// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_instructor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeInstructorModel _$ChangeInstructorModelFromJson(
  Map<String, dynamic> json,
) => ChangeInstructorModel()
  ..data = json['data']
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$ChangeInstructorModelToJson(
  ChangeInstructorModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'status': instance.status,
  'message': instance.message,
};
