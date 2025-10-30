import 'package:eazifly_student/data/models/my_programs/get_session_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetSessionDetailsEntity {
  @JsonKey(name: "data")
  SessionDetailsModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetSessionDetailsEntity({this.data, this.status, this.message});
}

class SessionDetailsEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "instructor")
  String? instructor;

  @JsonKey(name: "users")
  List<SessionUserModel>? users;

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

  SessionDetailsEntity({
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

class SessionUserEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "user_name")
  String? userName;

  SessionUserEntity({this.id, this.userName});
}
