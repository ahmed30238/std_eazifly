import 'package:eazifly_student/domain/entities/subscription_management/cancel_subscription_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cancel_subscription_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CancelSubscriptionModel extends CancelSubscriptionEntity {
  CancelSubscriptionModel();

  factory CancelSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$CancelSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CancelSubscriptionModelToJson(this);
}
