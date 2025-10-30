import 'package:json_annotation/json_annotation.dart';

import '../../../data/models/my_programs/get_program_sessions_model.dart';

class GetProgramSessionsEntity {
  @JsonKey(name: "data")
  List<ProgramSessionModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetProgramSessionsEntity({this.data, this.status, this.message});
}

class ProgramSessionEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "instructor")
  String? instructor;

  @JsonKey(name: "users")
  List<UserModel>? users;

  @JsonKey(name: "meeting_url")
  String? meetingUrl;

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
  DateTime? studentJoinTime;

  @JsonKey(name: "instructor_join_time")
  DateTime? instructorJoinTime;

  @JsonKey(name: "program_title")
  String? programTitle;

  @JsonKey(name: "program_id")
  String? programId;

  @JsonKey(name: "status")
  GetProgramSessionsStatusModel? status;

  ProgramSessionEntity({
    this.id,
    this.instructor,
    this.users,
    this.meetingUrl,
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

class UserEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "user_name")
  String? userName;

  UserEntity({this.id, this.userName});
}

class GetProgramSessionsStatus {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "key")
  String? key;

  GetProgramSessionsStatus({this.label, this.color, this.key});
}
