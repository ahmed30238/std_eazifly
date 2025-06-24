import 'package:eazifly_student/data/models/my_programs/get_program_assignments_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetProgramAssignmentsEntity {
  @JsonKey(name: "data")
  List<ProgramAssignmentModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetProgramAssignmentsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class ProgramAssignmentEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "text")
  String? text;

  @JsonKey(name: "deadline")
  DateTime? deadline;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "mark")
  String? mark;

  @JsonKey(name: "file")
  String? file;
  @JsonKey(name: "is_uploaded")
  bool? isUploaded;

  @JsonKey(name: "file_type")
  String? fileType;

  @JsonKey(name: "user_voice_note")
  String? userVoiceNote;

  @JsonKey(name: "instructor_voice_note")
  String? instructorVoiceNote;

  @JsonKey(name: "instructor_note")
  String? instructorNote;

  ProgramAssignmentEntity({
    this.id,
    this.title,
    this.text,
    this.deadline,
    this.createdAt,
    this.status,
    this.mark,
    this.file,
    this.fileType,
    this.userVoiceNote,
    this.instructorVoiceNote,
    this.instructorNote,
  });
}
