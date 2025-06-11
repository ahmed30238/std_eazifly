import 'package:eazifly_student/data/models/children/create_new_child_model.dart';
import 'package:json_annotation/json_annotation.dart';

class CreateNewChildEntity {
  @JsonKey(name: "data")
  NewChildModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  CreateNewChildEntity({
    this.data,
    this.status,
    this.message,
  });
}
