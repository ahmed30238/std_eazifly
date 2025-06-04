import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_items_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllItemsModel extends GetAllItemsEntity {
  GetAllItemsModel();

  factory GetAllItemsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllItemsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ItemModel extends ItemEntity {
  ItemModel();

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
