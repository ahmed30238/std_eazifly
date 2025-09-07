// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_programs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyProgramsModel _$GetMyProgramsModelFromJson(Map<String, dynamic> json) =>
    GetMyProgramsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => MyProgramModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetMyProgramsModelToJson(GetMyProgramsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };

MyProgramModel _$MyProgramModelFromJson(Map<String, dynamic> json) =>
    MyProgramModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..status = json['status'] as String?
      ..nextSession = json['next_session'] == null
          ? null
          : DateTime.parse(json['next_session'] as String)
      ..currentSession = json['current_session'] == null
          ? null
          : ProgramSessionModel.fromJson(
              json['current_session'] as Map<String, dynamic>,
            )
      ..duration = json['duration'] as String?
      ..numberOfSessionsPerWeek = json['number_of_sessions_per_week'] as String?
      ..numberOfStudents = (json['number_of_students'] as num?)?.toInt()
      ..image = json['image'] as String?
      ..startDate = json['Start_date'] == null
          ? null
          : DateTime.parse(json['Start_date'] as String)
      ..expireDate = json['expire_date'] == null
          ? null
          : DateTime.parse(json['expire_date'] as String);

Map<String, dynamic> _$MyProgramModelToJson(MyProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': instance.status,
      'next_session': instance.nextSession?.toIso8601String(),
      'current_session': instance.currentSession,
      'duration': instance.duration,
      'number_of_sessions_per_week': instance.numberOfSessionsPerWeek,
      'number_of_students': instance.numberOfStudents,
      'image': instance.image,
      'Start_date': instance.startDate?.toIso8601String(),
      'expire_date': instance.expireDate?.toIso8601String(),
    };

ProgramSessionModel _$ProgramSessionModelFromJson(Map<String, dynamic> json) =>
    ProgramSessionModel()
      ..id = (json['id'] as num?)?.toInt()
      ..status = json['status'] as String?;

Map<String, dynamic> _$ProgramSessionModelToJson(
  ProgramSessionModel instance,
) => <String, dynamic>{'id': instance.id, 'status': instance.status};
