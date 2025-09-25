import 'package:json_annotation/json_annotation.dart';

import '../../../data/models/user/add_user_session_date_and_time_model.dart';

class AddUserSessionDateAndTimeEntity {
  @JsonKey(name: "data")
  List<AddUserSessionDateAndTimeDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  AddUserSessionDateAndTimeEntity({
    this.data,
    this.status,
    this.message,
  });
}

class AddUserSessionDateAndTimeDatumEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "day")
  String? day;

  @JsonKey(name: "from")
  String? from;

  @JsonKey(name: "to")
  String? to;

  @JsonKey(name: "program_id")
  String? programId;

  @JsonKey(name: "instructor_id")
  String? instructorId;

  @JsonKey(name: "instructor_name")
  String? instructorName;

  @JsonKey(name: "program_name")
  String? programName;

  AddUserSessionDateAndTimeDatumEntity({
    this.id,
    this.day,
    this.from,
    this.to,
    this.programId,
    this.instructorId,
    this.instructorName,
    this.programName,
  });
}