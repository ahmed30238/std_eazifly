import 'package:eazifly_student/data/models/sessions/change_session_date_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ChangeSessionDateEntity {
  @JsonKey(name: "data")
  ChangeSessionDateDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  ChangeSessionDateEntity({this.data, this.status, this.message});
}

class ChangeSessionDateDataEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "instructor")
  String? instructor;
  @JsonKey(name: "users")
  List<ChangeSessionDateUserModel>? users;
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
  String? studentJoinTime;
  @JsonKey(name: "instructor_join_time")
  String? instructorJoinTime;
  @JsonKey(name: "program_title")
  String? programTitle;
  @JsonKey(name: "program_id")
  String? programId;
  @JsonKey(name: "status")
  ChangeSessionDateStatusModel? status;

  ChangeSessionDateDataEntity({
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

class ChangeSessionDateUserEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_name")
  String? userName;

  ChangeSessionDateUserEntity({this.id, this.userName});
}
