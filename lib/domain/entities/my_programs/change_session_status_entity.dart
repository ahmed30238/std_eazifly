import 'package:eazifly_student/data/models/my_programs/change_session_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ChangeSessionStatusEntity {
  @JsonKey(name: "data")
  ChangeSessionStatusDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  ChangeSessionStatusEntity({this.data, this.status, this.message});
}

class ChangeSessionStatusDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "instructor")
  String? instructor;

  @JsonKey(name: "users")
  List<ChangeSessionStatusUserModel>? users;

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
  DateTime? instructorJoinTime;

  @JsonKey(name: "program_title")
  String? programTitle;

  @JsonKey(name: "program_id")
  String? programId;

  @JsonKey(name: "status")
  String? status;

  ChangeSessionStatusDataEntity({
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

class ChangeSessionStatusUserEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "user_name")
  String? userName;

  ChangeSessionStatusUserEntity({this.id, this.userName});
}
