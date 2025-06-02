import 'package:eazifly_student/data/models/library/get_library_categories_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetAllLibraryListsEntity {
  @JsonKey(name: "data")
  List<LibraryListElementModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  GetAllLibraryListsEntity({
    this.data,
    this.status,
    this.message,
  });
}
