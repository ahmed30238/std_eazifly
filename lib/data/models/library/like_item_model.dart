import 'package:eazifly_student/domain/entities/like_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'like_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LikeItemModel extends LikeItemEntity {
  LikeItemModel();

  factory LikeItemModel.fromJson(Map<String, dynamic> json) =>
      _$LikeItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LikeItemModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LikeItemDataModel extends LikeItemDataEntity {
  LikeItemDataModel();

  factory LikeItemDataModel.fromJson(Map<String, dynamic> json) =>
      _$LikeItemDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LikeItemDataModelToJson(this);
}
