import 'package:eazifly_student/data/models/home/get_home_current_session_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetHomeCurrentSessionEntity {
  @JsonKey(name: "data")
  GetHomeCurrentSessionDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetHomeCurrentSessionEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetHomeCurrentSessionData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "instructor")
  String? instructor;
  @JsonKey(name: "users")
  List<GetHomeCurrentSessionUserModel>? users;
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

  GetHomeCurrentSessionData({
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

class GetHomeCurrentSessionUser {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "GetHomeCurrentSession_name")
  String? userName;

  GetHomeCurrentSessionUser({
    this.id,
    this.userName,
  });
}
