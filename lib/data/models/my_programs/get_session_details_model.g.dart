// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_session_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSessionDetailsModel _$GetSessionDetailsModelFromJson(
  Map<String, dynamic> json,
) => GetSessionDetailsModel()
  ..data = json['data'] == null
      ? null
      : SessionDetailsModel.fromJson(json['data'] as Map<String, dynamic>)
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetSessionDetailsModelToJson(
  GetSessionDetailsModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

SessionDetailsModel _$SessionDetailsModelFromJson(Map<String, dynamic> json) =>
    SessionDetailsModel()
      ..id = (json['id'] as num?)?.toInt()
      ..instructor = json['instructor'] as String?
      ..users = (json['users'] as List<dynamic>?)
          ?.map((e) => SessionUserModel.fromJson(e as Map<String, dynamic>))
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
      ..instructorJoinTime = json['instructor_join_time']
      ..programTitle = json['program_title'] as String?
      ..programId = json['program_id'] as String?
      ..status = json['status'] as String?;

Map<String, dynamic> _$SessionDetailsModelToJson(
  SessionDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'instructor': instance.instructor,
  'users': instance.users?.map((e) => e.toJson()).toList(),
  'meeting_url': instance.meetingUrl,
  'session_date': instance.sessionDate?.toIso8601String(),
  'session_time': instance.sessionTime,
  'session_datetime': instance.sessionDatetime?.toIso8601String(),
  'duration': instance.duration,
  'student_join_time': instance.studentJoinTime?.toIso8601String(),
  'instructor_join_time': instance.instructorJoinTime,
  'program_title': instance.programTitle,
  'program_id': instance.programId,
  'status': instance.status,
};

SessionUserModel _$SessionUserModelFromJson(Map<String, dynamic> json) =>
    SessionUserModel()
      ..id = (json['id'] as num?)?.toInt()
      ..userName = json['user_name'] as String?;

Map<String, dynamic> _$SessionUserModelToJson(SessionUserModel instance) =>
    <String, dynamic>{'id': instance.id, 'user_name': instance.userName};
