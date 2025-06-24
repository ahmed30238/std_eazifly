// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_assignment_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAssignmentDetailsModel _$GetAssignmentDetailsModelFromJson(
        Map<String, dynamic> json) =>
    GetAssignmentDetailsModel()
      ..data = json['data'] == null
          ? null
          : AssignmentDetailsDataModel.fromJson(
              json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetAssignmentDetailsModelToJson(
        GetAssignmentDetailsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

AssignmentDetailsDataModel _$AssignmentDetailsDataModelFromJson(
        Map<String, dynamic> json) =>
    AssignmentDetailsDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..text = json['text'] as String?
      ..deadline = json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String)
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..status = json['status'] as String?
      ..mark = json['mark'] as String?
      ..file = json['file'] as String?
      ..isUploaded = json['is_uploaded'] as bool?
      ..fileType = json['file_type'] as String?
      ..userVoiceNote = json['user_voice_note'] as String?
      ..instructorVoiceNote = json['instructor_voice_note'] as String?
      ..instructorNote = json['instructor_note'] as String?;

Map<String, dynamic> _$AssignmentDetailsDataModelToJson(
        AssignmentDetailsDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'deadline': instance.deadline?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'status': instance.status,
      'mark': instance.mark,
      'file': instance.file,
      'is_uploaded': instance.isUploaded,
      'file_type': instance.fileType,
      'user_voice_note': instance.userVoiceNote,
      'instructor_voice_note': instance.instructorVoiceNote,
      'instructor_note': instance.instructorNote,
    };
