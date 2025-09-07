// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_assignment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostAssignmentModel _$PostAssignmentModelFromJson(Map<String, dynamic> json) =>
    PostAssignmentModel()
      ..data = json['data']
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$PostAssignmentModelToJson(
  PostAssignmentModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'status': instance.status,
  'message': instance.message,
};
