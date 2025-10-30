import 'package:eazifly_student/domain/entities/get_list_items_using_list_id_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_list_items_using_list_id_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetListItemsUsingListIdModel extends GetListItemsUsingListIdEntity {
  GetListItemsUsingListIdModel();

  factory GetListItemsUsingListIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetListItemsUsingListIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetListItemsUsingListIdModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ListItemModel extends ListItemEntity {
  ListItemModel();

  factory ListItemModel.fromJson(Map<String, dynamic> json) =>
      _$ListItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListItemModelToJson(this);
}
