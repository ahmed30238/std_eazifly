// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_current_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeCurrentSessionModel _$GetHomeCurrentSessionModelFromJson(
  Map<String, dynamic> json,
) => GetHomeCurrentSessionModel()
  ..data = json['data'] == null
      ? null
      : GetHomeCurrentSessionDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        )
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetHomeCurrentSessionModelToJson(
  GetHomeCurrentSessionModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

GetHomeCurrentSessionDataModel _$GetHomeCurrentSessionDataModelFromJson(
  Map<String, dynamic> json,
) => GetHomeCurrentSessionDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..instructor = json['instructor'] as String?
  ..instructorId = json['instructor_id'] as String?
  ..users = (json['users'] as List<dynamic>?)
      ?.map(
        (e) =>
            GetHomeCurrentSessionUserModel.fromJson(e as Map<String, dynamic>),
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
      : GetHomeCurrentSessionStatusModel.fromJson(
          json['status'] as Map<String, dynamic>,
        );

Map<String, dynamic> _$GetHomeCurrentSessionDataModelToJson(
  GetHomeCurrentSessionDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'instructor': instance.instructor,
  'instructor_id': instance.instructorId,
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

GetHomeCurrentSessionUserModel _$GetHomeCurrentSessionUserModelFromJson(
  Map<String, dynamic> json,
) => GetHomeCurrentSessionUserModel()
  ..id = (json['id'] as num?)?.toInt()
  ..userName = json['user_name'] as String?
  ..userImage = json['user_image'] as String?;

Map<String, dynamic> _$GetHomeCurrentSessionUserModelToJson(
  GetHomeCurrentSessionUserModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_name': instance.userName,
  'user_image': instance.userImage,
};

GetHomeCurrentSessionStatusModel _$GetHomeCurrentSessionStatusModelFromJson(
  Map<String, dynamic> json,
) => GetHomeCurrentSessionStatusModel()
  ..label = json['label'] as String?
  ..color = json['color'] as String?
  ..key = json['key'] as String?;

Map<String, dynamic> _$GetHomeCurrentSessionStatusModelToJson(
  GetHomeCurrentSessionStatusModel instance,
) => <String, dynamic>{
  'label': instance.label,
  'color': instance.color,
  'key': instance.key,
};
