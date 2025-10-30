import 'package:eazifly_student/data/models/library/favourite_list/get_favourite_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

class AddSingleItemToFavListEntity {
  @JsonKey(name: "data")
  FavouriteDatumModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  AddSingleItemToFavListEntity({this.data, this.status, this.message});
}
