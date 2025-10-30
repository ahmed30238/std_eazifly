import 'package:eazifly_student/data/models/library/like_item_model.dart';
import 'package:json_annotation/json_annotation.dart';

class LikeItemEntity {
  @JsonKey(name: "data")
  LikeItemDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  LikeItemEntity({this.data, this.status, this.message});
}

class LikeItemDataEntity {
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

  @JsonKey(name: "library_list_id")
  String? libraryListId;

  @JsonKey(name: "payment_type")
  String? paymentType;

  @JsonKey(name: "item_type")
  String? itemType;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "liked")
  bool? liked;

  LikeItemDataEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.file,
    this.fileType,
    this.libraryListId,
    this.paymentType,
    this.itemType,
    this.createdAt,
    this.liked,
  });
}
