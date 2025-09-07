// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_closest_sessions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeClosestSessionsModel _$GetHomeClosestSessionsModelFromJson(
  Map<String, dynamic> json,
) => GetHomeClosestSessionsModel()
  ..data = (json['data'] as List<dynamic>?)
      ?.map(
        (e) => GetHomeClosestSessionsDatumModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetHomeClosestSessionsModelToJson(
  GetHomeClosestSessionsModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

GetHomeClosestSessionsDatumModel _$GetHomeClosestSessionsDatumModelFromJson(
  Map<String, dynamic> json,
) => GetHomeClosestSessionsDatumModel()
  ..id = (json['id'] as num?)?.toInt()
  ..instructor = json['instructor'] as String?
  ..users = (json['users'] as List<dynamic>?)
      ?.map(
        (e) =>
            GetHomeClosestSessionsUserModel.fromJson(e as Map<String, dynamic>),
      )
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
      : GetHomeClosestSessionStatusModel.fromJson(
          json['status'] as Map<String, dynamic>,
        );

Map<String, dynamic> _$GetHomeClosestSessionsDatumModelToJson(
  GetHomeClosestSessionsDatumModel instance,
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

GetHomeClosestSessionsUserModel _$GetHomeClosestSessionsUserModelFromJson(
  Map<String, dynamic> json,
) => GetHomeClosestSessionsUserModel()
  ..id = (json['id'] as num?)?.toInt()
  ..userName = json['user_name'] as String?;

Map<String, dynamic> _$GetHomeClosestSessionsUserModelToJson(
  GetHomeClosestSessionsUserModel instance,
) => <String, dynamic>{'id': instance.id, 'user_name': instance.userName};

GetHomeClosestSessionStatusModel _$GetHomeClosestSessionStatusModelFromJson(
  Map<String, dynamic> json,
) => GetHomeClosestSessionStatusModel()
  ..label = json['label'] as String?
  ..color = json['color'] as String?
  ..key = json['key'] as String?;

Map<String, dynamic> _$GetHomeClosestSessionStatusModelToJson(
  GetHomeClosestSessionStatusModel instance,
) => <String, dynamic>{
  'label': instance.label,
  'color': instance.color,
  'key': instance.key,
};
