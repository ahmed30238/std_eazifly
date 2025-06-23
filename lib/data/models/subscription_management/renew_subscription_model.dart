import 'package:eazifly_student/domain/entities/subscription_management/renew_subscription_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'renew_subscription_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RenewSubscriptionModel extends RenewSubscriptionEntity {
  RenewSubscriptionModel();

  factory RenewSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$RenewSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RenewSubscriptionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RenewSubscriptionDataModel extends RenewSubscriptionDataEntity {
  RenewSubscriptionDataModel();

  factory RenewSubscriptionDataModel.fromJson(Map<String, dynamic> json) =>
      _$RenewSubscriptionDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RenewSubscriptionDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RenewSubscriptionOrderDetailModel extends RenewSubscriptionOrderDetailEntity {
  RenewSubscriptionOrderDetailModel();

  factory RenewSubscriptionOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RenewSubscriptionOrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$RenewSubscriptionOrderDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RenewSubscriptionStatusModel extends RenewSubscriptionStatusEntity {
  RenewSubscriptionStatusModel();

  factory RenewSubscriptionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$RenewSubscriptionStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$RenewSubscriptionStatusModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RenewSubscriptionUserModel extends RenewSubscriptionUserEntity {
  RenewSubscriptionUserModel();

  factory RenewSubscriptionUserModel.fromJson(Map<String, dynamic> json) =>
      _$RenewSubscriptionUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$RenewSubscriptionUserModelToJson(this);
}
