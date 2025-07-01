import 'package:eazifly_student/data/models/sessions/cancel_session_model.dart';
import 'package:json_annotation/json_annotation.dart';

class CancelSessionEntity {
  @JsonKey(name: "data")
  CancelSessionDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  CancelSessionEntity({
    this.data,
    this.status,
    this.message,
  });
}

class CancelSessionDataEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "instructor")
  String? instructor;
  @JsonKey(name: "users")
  List<CancelSessionUserModel>? users;
  @JsonKey(name: "meeting_url")
  String? meetingUrl;
  @JsonKey(name: "day")
  String? day;
  @JsonKey(name: "session_date")
  DateTime? sessionDate;
  @JsonKey(name: "session_time")
  String? sessionTime;
  @JsonKey(name: "session_time_to")
  String? sessionTimeTo;
  @JsonKey(name: "session_datetime")
  DateTime? sessionDatetime;
  @JsonKey(name: "duration")
  String? duration;
  @JsonKey(name: "student_join_time")
  dynamic studentJoinTime;
  @JsonKey(name: "instructor_join_time")
  dynamic instructorJoinTime;
  @JsonKey(name: "program_title")
  String? programTitle;
  @JsonKey(name: "program_id")
  String? programId;
  @JsonKey(name: "status")
  String? status;

  CancelSessionDataEntity({
    this.id,
    this.instructor,
    this.users,
    this.meetingUrl,
    this.day,
    this.sessionDate,
    this.sessionTime,
    this.sessionTimeTo,
    this.sessionDatetime,
    this.duration,
    this.studentJoinTime,
    this.instructorJoinTime,
    this.programTitle,
    this.programId,
    this.status,
  });
}

class CancelSessionUserEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_name")
  String? userName;

  CancelSessionUserEntity({
    this.id,
    this.userName,
  });
}
