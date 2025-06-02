import 'package:eazifly_student/data/models/library/get_library_categories_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetLibraryCategoriesEntity {
  @JsonKey(name: "data")
  List<LibraryCategoryDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetLibraryCategoriesEntity({this.data, this.status, this.message});
}

class LibraryCategoryDatumEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "lists")
  List<LibraryListElementModel>? lists;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  LibraryCategoryDatumEntity({
    this.id,
    this.title,
    this.type,
    this.lists,
    this.createdAt,
  });
}

class LibraryListElementEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "file")
  String? file;

  @JsonKey(name: "file_type")
  String? fileType;

  @JsonKey(name: "library_category_id")
  String? libraryCategoryId;

  @JsonKey(name: "library_category")
  String? libraryCategory;

  @JsonKey(name: "total_items")
  int? totalItems;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  LibraryListElementEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.file,
    this.fileType,
    this.libraryCategoryId,
    this.libraryCategory,
    this.totalItems,
    this.createdAt,
  });
}
