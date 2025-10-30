import 'package:eazifly_student/domain/entities/get_order_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_order_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetOrderDetailsModel extends GetOrderDetailsEntity {
  GetOrderDetailsModel();

  factory GetOrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrderDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrderDetailsModelToJson(this);
}

@JsonSerializable()
class GetOrderDetailsDataModel extends GetOrderDetailsDataEntity {
  GetOrderDetailsDataModel();

  factory GetOrderDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetOrderDetailsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetOrderDetailsDataModelToJson(this);
}
