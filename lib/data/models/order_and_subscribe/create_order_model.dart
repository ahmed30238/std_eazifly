import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateOrderModel extends CreateOrderEntity {
  CreateOrderModel();

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderDataModel extends CreateOrderDataEntity {
  CreateOrderDataModel();

  factory CreateOrderDataModel.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderOrderDetail extends CreateOrderDetailEntity {
  CreateOrderOrderDetail();

  factory CreateOrderOrderDetail.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderOrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderOrderDetailToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderStatus extends CreateOrderStatusEntity {
  CreateOrderStatus();

  factory CreateOrderStatus.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderStatusFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderStatusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderUser extends CreateOrderUserEntity {
  CreateOrderUser();

  factory CreateOrderUser.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderUserFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderOrderNoteModel extends CreateOrderOrderNoteEntity {
  CreateOrderOrderNoteModel() : super();

  factory CreateOrderOrderNoteModel.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderOrderNoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderOrderNoteModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderMakerModel extends CreateOrderMakerEntity {
  CreateOrderMakerModel() : super();

  factory CreateOrderMakerModel.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderMakerModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderMakerModelToJson(this);
}
