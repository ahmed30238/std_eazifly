import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:eazifly_student/domain/entities/store_favourite_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'store_favourite_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StoreFavouriteListModel extends StoreFavouriteListEntity {
  StoreFavouriteListModel();

  factory StoreFavouriteListModel.fromJson(Map<String, dynamic> json) =>
      _$StoreFavouriteListModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreFavouriteListModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StoreFavouriteDataModel extends FavouriteDatumEntity {
  StoreFavouriteDataModel();

  factory StoreFavouriteDataModel.fromJson(Map<String, dynamic> json) =>
      _$StoreFavouriteDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreFavouriteDataModelToJson(this);
}
