import 'package:eazifly_student/domain/entities/get_favourite_list_items_using_list_id_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_favourite_list_items_using_list_id_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetFavouriteListItemsUsingListIdModel
    extends GetFavouriteListItemsUsingListIdEntity {
  GetFavouriteListItemsUsingListIdModel();

  factory GetFavouriteListItemsUsingListIdModel.fromJson(
    Map<String, dynamic> json,
  ) => _$GetFavouriteListItemsUsingListIdModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetFavouriteListItemsUsingListIdModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FavouriteItemModel extends FavouriteItemEntity {
  FavouriteItemModel();

  factory FavouriteItemModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteItemModelToJson(this);
}
