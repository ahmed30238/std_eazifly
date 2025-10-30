// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:eazifly_student/data/models/home/get_home_closest_sessions_model.dart';

class GetHomeClosestSessionsEntity {
  @JsonKey(name: "data")
  List<GetHomeClosestSessionsDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetHomeClosestSessionsEntity({this.data, this.status, this.message});
}

class GetHomeClosestSessionsDatum {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "instructor")
  String? instructor;
  @JsonKey(name: "users")
  List<GetHomeClosestSessionsUserModel>? users;
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
  GetHomeClosestSessionStatusModel? status;

  GetHomeClosestSessionsDatum({
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

class GetHomeClosestSessionsUser {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_name")
  String? userName;

  GetHomeClosestSessionsUser({this.id, this.userName});
}

class GetHomeClosestSessionStatus {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "color")
  String? color;
  @JsonKey(name: "key")
  String? key;
  GetHomeClosestSessionStatus({this.label, this.color, this.key});
}
