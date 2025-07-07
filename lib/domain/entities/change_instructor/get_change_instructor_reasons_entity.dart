import 'package:eazifly_student/data/models/change_instructor/get_change_instructor_reasons_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetChangeInstructorReasonsEntity {
  @JsonKey(name: "data")
  List<GetChangeInstructorReasonsDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetChangeInstructorReasonsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetChangeInstructorReasonsDatumEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;

  GetChangeInstructorReasonsDatumEntity({
    this.id,
    this.title,
  });
}
