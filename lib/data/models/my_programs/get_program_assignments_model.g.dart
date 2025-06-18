// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_program_assignments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProgramAssignmentsModel _$GetProgramAssignmentsModelFromJson(
        Map<String, dynamic> json) =>
    GetProgramAssignmentsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map(
              (e) => ProgramAssignmentModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetProgramAssignmentsModelToJson(
        GetProgramAssignmentsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

ProgramAssignmentModel _$ProgramAssignmentModelFromJson(
        Map<String, dynamic> json) =>
    ProgramAssignmentModel()
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
      ..fileType = json['file_type'] as String?
      ..userVoiceNote = json['user_voice_note'] as String?
      ..instructorVoiceNote = json['instructor_voice_note'] as String?
      ..instructorNote = json['instructor_note'] as String?;

Map<String, dynamic> _$ProgramAssignmentModelToJson(
        ProgramAssignmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'deadline': instance.deadline?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'status': instance.status,
      'mark': instance.mark,
      'file': instance.file,
      'file_type': instance.fileType,
      'user_voice_note': instance.userVoiceNote,
      'instructor_voice_note': instance.instructorVoiceNote,
      'instructor_note': instance.instructorNote,
    };
