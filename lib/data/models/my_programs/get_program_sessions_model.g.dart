// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_program_sessions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProgramSessionsModel _$GetProgramSessionsModelFromJson(
        Map<String, dynamic> json) =>
    GetProgramSessionsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => ProgramSessionModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetProgramSessionsModelToJson(
        GetProgramSessionsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

ProgramSessionModel _$ProgramSessionModelFromJson(Map<String, dynamic> json) =>
    ProgramSessionModel()
      ..id = (json['id'] as num?)?.toInt()
      ..instructor = json['instructor'] as String?
      ..users = (json['users'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..meetingUrl = json['meeting_url'] as String?
      ..sessionDate = json['session_date'] == null
          ? null
          : DateTime.parse(json['session_date'] as String)
      ..sessionTime = json['session_time'] as String?
      ..sessionTimeTo = json['session_time_to'] as String?
      ..sessionDatetime = json['session_datetime'] == null
          ? null
          : DateTime.parse(json['session_datetime'] as String)
      ..duration = json['duration'] as String?
      ..studentJoinTime = json['student_join_time'] == null
          ? null
          : DateTime.parse(json['student_join_time'] as String)
      ..instructorJoinTime = json['instructor_join_time'] == null
          ? null
          : DateTime.parse(json['instructor_join_time'] as String)
      ..programTitle = json['program_title'] as String?
      ..programId = json['program_id'] as String?
      ..status = json['status'] as String?;

Map<String, dynamic> _$ProgramSessionModelToJson(
        ProgramSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instructor': instance.instructor,
      'users': instance.users?.map((e) => e.toJson()).toList(),
      'meeting_url': instance.meetingUrl,
      'session_date': instance.sessionDate?.toIso8601String(),
      'session_time': instance.sessionTime,
      'session_time_to': instance.sessionTimeTo,
      'session_datetime': instance.sessionDatetime?.toIso8601String(),
      'duration': instance.duration,
      'student_join_time': instance.studentJoinTime?.toIso8601String(),
      'instructor_join_time': instance.instructorJoinTime?.toIso8601String(),
      'program_title': instance.programTitle,
      'program_id': instance.programId,
      'status': instance.status,
    };

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel()
  ..id = (json['id'] as num?)?.toInt()
  ..userName = json['user_name'] as String?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
    };
