// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelSessionModel _$CancelSessionModelFromJson(Map<String, dynamic> json) =>
    CancelSessionModel()
      ..data = json['data'] == null
          ? null
          : CancelSessionDataModel.fromJson(
              json['data'] as Map<String, dynamic>,
            )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$CancelSessionModelToJson(CancelSessionModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

CancelSessionDataModel _$CancelSessionDataModelFromJson(
  Map<String, dynamic> json,
) => CancelSessionDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..instructor = json['instructor'] as String?
  ..users = (json['users'] as List<dynamic>?)
      ?.map((e) => CancelSessionUserModel.fromJson(e as Map<String, dynamic>))
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
  ..studentJoinTime = json['student_join_time']
  ..instructorJoinTime = json['instructor_join_time']
  ..programTitle = json['program_title'] as String?
  ..programId = json['program_id'] as String?
  ..status = json['status'] == null
      ? null
      : CancelSessionStatusModel.fromJson(
          json['status'] as Map<String, dynamic>,
        );

Map<String, dynamic> _$CancelSessionDataModelToJson(
  CancelSessionDataModel instance,
) => <String, dynamic>{
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
  'status': instance.status?.toJson(),
};

CancelSessionUserModel _$CancelSessionUserModelFromJson(
  Map<String, dynamic> json,
) => CancelSessionUserModel()
  ..id = (json['id'] as num?)?.toInt()
  ..userName = json['user_name'] as String?;

Map<String, dynamic> _$CancelSessionUserModelToJson(
  CancelSessionUserModel instance,
) => <String, dynamic>{'id': instance.id, 'user_name': instance.userName};

CancelSessionStatusModel _$CancelSessionStatusModelFromJson(
  Map<String, dynamic> json,
) => CancelSessionStatusModel()
  ..label = json['label'] as String?
  ..color = json['color'] as String?
  ..key = json['key'] as String?;

Map<String, dynamic> _$CancelSessionStatusModelToJson(
  CancelSessionStatusModel instance,
) => <String, dynamic>{
  'label': instance.label,
  'color': instance.color,
  'key': instance.key,
};
