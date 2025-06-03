import 'package:eazifly_student/data/models/library/favourite_list/get_favourite_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetFavouriteListEntity {
  @JsonKey(name: "data")
  List<FavouriteDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  GetFavouriteListEntity({
    this.data,
    this.status,
    this.message,
  });
}

class FavouriteDatumEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "number_of_items")
  int? numberOfItems;
  FavouriteDatumEntity({
    this.id,
    this.title,
    this.image,
    this.numberOfItems,
  });
}
