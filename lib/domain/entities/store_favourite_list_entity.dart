import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

class StoreFavouriteListEntity {
  @JsonKey(name: "data")
  StoreFavouriteDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  StoreFavouriteListEntity({
    this.data,
    this.status,
    this.message,
  });
}

class StoreFavouriteDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "image")
  dynamic image;

  @JsonKey(name: "number_of_items")
  int? numberOfItems;

  StoreFavouriteDataEntity({
    this.id,
    this.title,
    this.image,
    this.numberOfItems,
  });
}
