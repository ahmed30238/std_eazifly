import 'package:eazifly_student/data/models/my_programs/content/get_program_content_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetProgramContentEntity {
  @JsonKey(name: "data")
  List<ProgramContentDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetProgramContentEntity({
    this.data,
    this.status,
    this.message,
  });
}

class ProgramContentDatumEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  ProgramContentDatumEntity({
    this.id,
    this.title,
  });
}
