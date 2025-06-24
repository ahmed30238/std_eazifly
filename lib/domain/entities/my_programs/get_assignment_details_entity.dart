import 'package:eazifly_student/data/models/my_programs/get_assignment_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetAssignmentDetailsEntity {
  @JsonKey(name: "data")
  AssignmentDetailsDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetAssignmentDetailsEntity({
    this.data,
    this.status,
    this.message,
  });
}
