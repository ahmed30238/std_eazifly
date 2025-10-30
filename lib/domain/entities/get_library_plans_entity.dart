import 'package:eazifly_student/data/models/library/plans/get_library_plans_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetLibraryPlansEntity {
  @JsonKey(name: "data")
  List<LibraryPlanModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetLibraryPlansEntity({this.data, this.status, this.message});
}

class LibraryPlanEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "price")
  int? price;

  @JsonKey(name: "days")
  int? days;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  LibraryPlanEntity({
    this.id,
    this.price,
    this.days,
    this.title,
    this.description,
  });
}
