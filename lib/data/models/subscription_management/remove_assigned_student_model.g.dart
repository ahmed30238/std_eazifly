// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_assigned_student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoveAssignedStudentModel _$RemoveAssignedStudentModelFromJson(
        Map<String, dynamic> json) =>
    RemoveAssignedStudentModel()
      ..data = json['data']
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$RemoveAssignedStudentModelToJson(
        RemoveAssignedStudentModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
