// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_session_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeSessionStatusModel _$ChangeSessionStatusModelFromJson(
        Map<String, dynamic> json) =>
    ChangeSessionStatusModel()
      ..data = json['data'] == null
          ? null
          : ChangeSessionStatusDataModel.fromJson(
              json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChangeSessionStatusModelToJson(
        ChangeSessionStatusModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

ChangeSessionStatusDataModel _$ChangeSessionStatusDataModelFromJson(
        Map<String, dynamic> json) =>
    ChangeSessionStatusDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..instructor = json['instructor'] as String?
      ..users = (json['users'] as List<dynamic>?)
          ?.map((e) =>
              ChangeSessionStatusUserModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..meetingUrl = json['meeting_url'] as String?
      ..sessionDate = json['session_date'] == null
          ? null
          : DateTime.parse(json['session_date'] as String)
      ..sessionTime = json['session_time'] as String?
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

Map<String, dynamic> _$ChangeSessionStatusDataModelToJson(
        ChangeSessionStatusDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instructor': instance.instructor,
      'users': instance.users?.map((e) => e.toJson()).toList(),
      'meeting_url': instance.meetingUrl,
      'session_date': instance.sessionDate?.toIso8601String(),
      'session_time': instance.sessionTime,
      'session_datetime': instance.sessionDatetime?.toIso8601String(),
      'duration': instance.duration,
      'student_join_time': instance.studentJoinTime?.toIso8601String(),
      'instructor_join_time': instance.instructorJoinTime?.toIso8601String(),
      'program_title': instance.programTitle,
      'program_id': instance.programId,
      'status': instance.status,
    };

ChangeSessionStatusUserModel _$ChangeSessionStatusUserModelFromJson(
        Map<String, dynamic> json) =>
    ChangeSessionStatusUserModel()
      ..id = (json['id'] as num?)?.toInt()
      ..userName = json['user_name'] as String?;

Map<String, dynamic> _$ChangeSessionStatusUserModelToJson(
        ChangeSessionStatusUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
    };
