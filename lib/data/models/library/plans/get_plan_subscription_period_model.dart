import 'package:eazifly_student/domain/entities/get_plan_subscription_period_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_plan_subscription_period_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPlanSubscriptionPeriodModel extends GetPlanSubscriptionPeriodEntity {
  GetPlanSubscriptionPeriodModel();

  factory GetPlanSubscriptionPeriodModel.fromJson(Map<String, dynamic> json) =>
      _$GetPlanSubscriptionPeriodModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPlanSubscriptionPeriodModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PlanSubscriptionPeriodModel extends PlanSubscriptionPeriodEntity {
  PlanSubscriptionPeriodModel();

  factory PlanSubscriptionPeriodModel.fromJson(Map<String, dynamic> json) =>
      _$PlanSubscriptionPeriodModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanSubscriptionPeriodModelToJson(this);
}
