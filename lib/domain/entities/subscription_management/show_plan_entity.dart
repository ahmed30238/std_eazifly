// show_plan_entity.dart

import 'package:eazifly_student/data/models/subscription_management/show_plan_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ShowPlanEntity {
  @JsonKey(name: "data")
  ShowPlanDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  ShowPlanEntity({
    this.data,
    this.status,
    this.message,
  });
}

class DataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "program")
  String? program;

  @JsonKey(name: "label")
  String? label;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "currency")
  String? currency;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "discount_price")
  String? discountPrice;

  @JsonKey(name: "subscripe_days")
  String? subscripeDays;

  @JsonKey(name: "duration")
  String? duration;

  @JsonKey(name: "number_of_session_per_week")
  String? numberOfSessionPerWeek;

  @JsonKey(name: "is_special_plan")
  bool? isSpecialPlan;

  @JsonKey(name: "type")
  String? type;

  DataEntity({
    this.id,
    this.title,
    this.program,
    this.label,
    this.description,
    this.currency,
    this.price,
    this.discountPrice,
    this.subscripeDays,
    this.duration,
    this.numberOfSessionPerWeek,
    this.isSpecialPlan,
    this.type,
  });
}
