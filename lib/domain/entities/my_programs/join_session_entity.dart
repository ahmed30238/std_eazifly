import 'package:eazifly_student/data/models/my_programs/join_session_model.dart';
import 'package:json_annotation/json_annotation.dart';

class JoinSessionEntity {
  @JsonKey(name: "data")
  JoinSessionDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  JoinSessionEntity({
    this.data,
    this.status,
    this.message,
  });
}

class JoinSessionDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "instructor")
  String? instructor;

  @JsonKey(name: "users")
  List<JoinSessionUserModel>? users;

  @JsonKey(name: "meeting_url")
  String? meetingUrl;

  @JsonKey(name: "session_date")
  DateTime? sessionDate;

  @JsonKey(name: "session_time")
  String? sessionTime;

  @JsonKey(name: "session_datetime")
  DateTime? sessionDatetime;

  @JsonKey(name: "duration")
  String? duration;

  @JsonKey(name: "student_join_time")
  DateTime? studentJoinTime;

  @JsonKey(name: "instructor_join_time")
  dynamic instructorJoinTime;

  @JsonKey(name: "program_title")
  String? programTitle;

  @JsonKey(name: "program_id")
  String? programId;

  @JsonKey(name: "status")
  String? status;

  JoinSessionDataEntity({
    this.id,
    this.instructor,
    this.users,
    this.meetingUrl,
    this.sessionDate,
    this.sessionTime,
    this.sessionDatetime,
    this.duration,
    this.studentJoinTime,
    this.instructorJoinTime,
    this.programTitle,
    this.programId,
    this.status,
  });
}

class JoinSessionUserEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "user_name")
  String? userName;

  JoinSessionUserEntity({
    this.id,
    this.userName,
  });
}
