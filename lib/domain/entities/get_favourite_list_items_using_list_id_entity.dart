import 'package:eazifly_student/data/models/library/favourite_list/get_favourite_list_items_using_list_id_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetFavouriteListItemsUsingListIdEntity {
  @JsonKey(name: "data")
  List<FavouriteItemModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetFavouriteListItemsUsingListIdEntity({
    this.data,
    this.status,
    this.message,
  });
}

class FavouriteItemEntity {
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

  FavouriteItemEntity({
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
  });
}
