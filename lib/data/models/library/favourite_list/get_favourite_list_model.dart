import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_favourite_list_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetFavouriteListModel extends GetFavouriteListEntity {
  GetFavouriteListModel();

  factory GetFavouriteListModel.fromJson(Map<String, dynamic> json) =>
      _$GetFavouriteListModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetFavouriteListModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FavouriteDatumModel extends FavouriteDatumEntity {
  FavouriteDatumModel();

  factory FavouriteDatumModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavouriteDatumModelToJson(this);
}
