import 'package:eazifly_student/data/models/library/favourite_list/get_favourite_list_model.dart';
import 'package:eazifly_student/domain/entities/add_single_item_to_fav_list_entity.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'add_single_item_to_fav_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddSingleItemToFavListModel extends AddSingleItemToFavListEntity {
  AddSingleItemToFavListModel();

  factory AddSingleItemToFavListModel.fromJson(Map<String, dynamic> json) =>
      _$AddSingleItemToFavListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddSingleItemToFavListModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FavItemModel extends FavouriteDatumEntity {
  FavItemModel();

  factory FavItemModel.fromJson(Map<String, dynamic> json) =>
      _$FavItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavItemModelToJson(this);
}
