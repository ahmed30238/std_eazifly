import 'package:eazifly_student/data/models/library/show_library_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ShowLibraryItemEntity {
  @JsonKey(name: "data")
  LibraryItemModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  ShowLibraryItemEntity({this.data, this.status, this.message});
}
