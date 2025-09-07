// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_assigments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeAssignmentsModel _$GetHomeAssignmentsModelFromJson(
  Map<String, dynamic> json,
) => GetHomeAssignmentsModel()
  ..data = (json['data'] as List<dynamic>?)
      ?.map(
        (e) => GetHomeAssigmentsDatumModel.fromJson(e as Map<String, dynamic>),
      )
      .toList()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetHomeAssignmentsModelToJson(
  GetHomeAssignmentsModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

GetHomeAssigmentsDatumModel _$GetHomeAssigmentsDatumModelFromJson(
  Map<String, dynamic> json,
) => GetHomeAssigmentsDatumModel()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..text = json['text'] as String?
  ..deadline = json['deadline'] == null
      ? null
      : DateTime.parse(json['deadline'] as String)
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..isUploaded = json['is_uploaded'] as bool?
  ..status = json['status'] as String?
  ..mark = (json['mark'] as num?)?.toInt()
  ..answer = json['answer'] as String?
  ..file = json['file'] as String?
  ..fileType = json['file_type'] as String?
  ..userVoiceNote = json['user_voice_note'] as String?
  ..instructorVoiceNote = json['instructor_voice_note'] as String?
  ..instructorNote = json['instructor_note'] as String?;

Map<String, dynamic> _$GetHomeAssigmentsDatumModelToJson(
  GetHomeAssigmentsDatumModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'text': instance.text,
  'deadline': instance.deadline?.toIso8601String(),
  'created_at': instance.createdAt?.toIso8601String(),
  'is_uploaded': instance.isUploaded,
  'status': instance.status,
  'mark': instance.mark,
  'answer': instance.answer,
  'file': instance.file,
  'file_type': instance.fileType,
  'user_voice_note': instance.userVoiceNote,
  'instructor_voice_note': instance.instructorVoiceNote,
  'instructor_note': instance.instructorNote,
};
