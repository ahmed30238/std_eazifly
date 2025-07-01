// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_session_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeSessionDateModel _$ChangeSessionDateModelFromJson(
        Map<String, dynamic> json) =>
    ChangeSessionDateModel()
      ..data = json['data'] == null
          ? null
          : ChangeSessionDateDataModel.fromJson(
              json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChangeSessionDateModelToJson(
        ChangeSessionDateModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

ChangeSessionDateDataModel _$ChangeSessionDateDataModelFromJson(
        Map<String, dynamic> json) =>
    ChangeSessionDateDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..instructor = json['instructor'] as String?
      ..users = (json['users'] as List<dynamic>?)
          ?.map((e) =>
              ChangeSessionDateUserModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..meetingUrl = json['meeting_url'] as String?
      ..day = json['day'] as String?
      ..sessionDate = json['session_date'] == null
          ? null
          : DateTime.parse(json['session_date'] as String)
      ..sessionTime = json['session_time'] as String?
      ..sessionTimeTo = json['session_time_to'] as String?
      ..sessionDatetime = json['session_datetime'] == null
          ? null
          : DateTime.parse(json['session_datetime'] as String)
      ..duration = json['duration'] as String?
      ..studentJoinTime = json['student_join_time'] as String?
      ..instructorJoinTime = json['instructor_join_time'] as String?
      ..programTitle = json['program_title'] as String?
      ..programId = json['program_id'] as String?
      ..status = json['status'] as String?;

Map<String, dynamic> _$ChangeSessionDateDataModelToJson(
        ChangeSessionDateDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instructor': instance.instructor,
      'users': instance.users?.map((e) => e.toJson()).toList(),
      'meeting_url': instance.meetingUrl,
      'day': instance.day,
      'session_date': instance.sessionDate?.toIso8601String(),
      'session_time': instance.sessionTime,
      'session_time_to': instance.sessionTimeTo,
      'session_datetime': instance.sessionDatetime?.toIso8601String(),
      'duration': instance.duration,
      'student_join_time': instance.studentJoinTime,
      'instructor_join_time': instance.instructorJoinTime,
      'program_title': instance.programTitle,
      'program_id': instance.programId,
      'status': instance.status,
    };

ChangeSessionDateUserModel _$ChangeSessionDateUserModelFromJson(
        Map<String, dynamic> json) =>
    ChangeSessionDateUserModel()
      ..id = (json['id'] as num?)?.toInt()
      ..userName = json['user_name'] as String?;

Map<String, dynamic> _$ChangeSessionDateUserModelToJson(
        ChangeSessionDateUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
    };
