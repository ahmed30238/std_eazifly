import 'package:eazifly_student/data/models/programs/get_program_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetProgramDetailsEntity {
  @JsonKey(name: "data")
  ProgramDetailsDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetProgramDetailsEntity({this.data, this.status, this.message});
}
