
// ignore_for_file: overridden_fields

import 'package:eazifly_student/data/models/order_and_subscribe/create_order_model.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';
import 'package:eazifly_student/domain/entities/get_user_orders_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_orders_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUserOrdersModel extends GetUserOrdersEntity {
  // @override
  @override
  @JsonKey(name: "data")
  final List<CreateOrderDataModel>? data;

  // @override
  @override
  @JsonKey(name: "status")
  final int? status;

  // @override
  @override
  @JsonKey(name: "message")
  final String? message;

  const GetUserOrdersModel({
    this.data,
    this.status,
    this.message,
  }) : super(
          data: data,
          status: status,
          message: message,
        );

  factory GetUserOrdersModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserOrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserOrdersModelToJson(this);

}

@JsonSerializable(explicitToJson: true)
class UserOrderModel extends CreateOrderDataEntity {
  UserOrderModel();

  factory UserOrderModel.fromJson(Map<String, dynamic> json) =>
      _$UserOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserOrderModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderDetailModel extends CreateOrderDetailEntity {
  OrderDetailModel();

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StatusModel extends CreateOrderStatusEntity {
  StatusModel();

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderUserModel extends CreateOrderUserEntity {
  OrderUserModel();

  factory OrderUserModel.fromJson(Map<String, dynamic> json) =>
      _$OrderUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderUserModelToJson(this);
}
