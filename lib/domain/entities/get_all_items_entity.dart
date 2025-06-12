import 'package:eazifly_student/data/models/library/get_all_items_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetAllItemsEntity {
  @JsonKey(name: "data")
  List<ItemModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetAllItemsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class ItemEntity {
  static int? customInt(val) {
    return int.tryParse(val?.toString() ?? "");
  }

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

  @JsonKey(name: "library_list_id", fromJson: customInt)
  int? libraryListId;

  @JsonKey(name: "payment_type")
  String? paymentType;

  @JsonKey(name: "item_type")
  String? itemType;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "liked")
  bool? liked;

  ItemEntity({
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
