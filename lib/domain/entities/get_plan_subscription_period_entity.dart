import 'package:eazifly_student/data/models/library/plans/get_plan_subscription_period_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetPlanSubscriptionPeriodEntity {
  @JsonKey(name: "data")
  List<PlanSubscriptionPeriodModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetPlanSubscriptionPeriodEntity({
    this.data,
    this.status,
    this.message,
  });
}

class PlanSubscriptionPeriodEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "days")
  String? days;

  PlanSubscriptionPeriodEntity({
    this.id,
    this.title,
    this.days,
  });
}
