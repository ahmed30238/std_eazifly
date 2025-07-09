import 'package:eazifly_student/data/models/home/get_home_assigments_model.dart';
import 'package:json_annotation/json_annotation.dart';


class GetHomeAssignmentsEntity {
  @JsonKey(name: "data")
  List<GetHomeAssigmentsDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetHomeAssignmentsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetHomeAssigmentsDatumEntity {
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
  @JsonKey(name: "is_uploaded")
  bool? isUploaded;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "mark")
  int? mark;
  @JsonKey(name: "answer")
  String? answer;
  @JsonKey(name: "file")
  String? file;
  @JsonKey(name: "file_type")
  String? fileType;
  @JsonKey(name: "user_voice_note")
  String? userVoiceNote;
  @JsonKey(name: "instructor_voice_note")
  String? instructorVoiceNote;
  @JsonKey(name: "instructor_note")
  String? instructorNote;

  GetHomeAssigmentsDatumEntity({
    this.id,
    this.title,
    this.text,
    this.deadline,
    this.createdAt,
    this.isUploaded,
    this.status,
    this.mark,
    this.answer,
    this.file,
    this.fileType,
    this.userVoiceNote,
    this.instructorVoiceNote,
    this.instructorNote,
  });
}
