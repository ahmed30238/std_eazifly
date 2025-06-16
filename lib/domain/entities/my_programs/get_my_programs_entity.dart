import 'package:eazifly_student/data/models/my_programs/get_my_programs_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetMyProgramsEntity {
  @JsonKey(name: "data")
  List<MyProgramModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetMyProgramsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class MyProgramEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "next_session")
  DateTime? nextSession;

  @JsonKey(name: "current_session")
  ProgramSessionModel? currentSession;

  @JsonKey(name: "duration")
  String? duration;

  @JsonKey(name: "number_of_sessions_per_week")
  String? numberOfSessionsPerWeek;

  @JsonKey(name: "number_of_students")
  int? numberOfStudents;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "Start_date")
  DateTime? startDate;

  @JsonKey(name: "expire_date")
  DateTime? expireDate;

  MyProgramEntity({
    this.id,
    this.title,
    this.description,
    this.status,
    this.nextSession,
    this.currentSession,
    this.duration,
    this.numberOfSessionsPerWeek,
    this.numberOfStudents,
    this.image,
    this.startDate,
    this.expireDate,
  });
}

class ProgramSessionEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "status")
  String? status;

  ProgramSessionEntity({
    this.id,
    this.status,
  });
}
