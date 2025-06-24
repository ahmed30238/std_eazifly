
import 'package:eazifly_student/domain/entities/subscription_management/upgrade_order_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'upgrade_order_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UpgradeOrderModel extends UpgradeOrderEntity {
  UpgradeOrderModel();

  factory UpgradeOrderModel.fromJson(Map<String, dynamic> json) =>
      _$UpgradeOrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeOrderModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpgradeOrderDataModel extends UpgradeOrderDataEntity {
  UpgradeOrderDataModel();

  factory UpgradeOrderDataModel.fromJson(Map<String, dynamic> json) =>
      _$UpgradeOrderDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeOrderDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpgradeOrderDetailModel extends UpgradeOrderDetailEntity {
  UpgradeOrderDetailModel();

  factory UpgradeOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UpgradeOrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeOrderDetailModelToJson(this);
}

@JsonSerializable()
class UpgradeOrderStatusModel extends UpgradeOrderStatusEntity {
  UpgradeOrderStatusModel();

  factory UpgradeOrderStatusModel.fromJson(Map<String, dynamic> json) =>
      _$UpgradeOrderStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeOrderStatusModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpgradeOrderUserModel extends UpgradeOrderUserEntity {
  UpgradeOrderUserModel();

  factory UpgradeOrderUserModel.fromJson(Map<String, dynamic> json) =>
      _$UpgradeOrderUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeOrderUserModelToJson(this);
}