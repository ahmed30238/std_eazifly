import 'package:eazifly_student/data/models/order_and_subscribe/get_plan_with_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetPlansWithDetailsEntity {
  @JsonKey(name: "data")
  List<PlanDetailsModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetPlansWithDetailsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class PlanDetailsEntity {
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
  dynamic subscripeDays;

  @JsonKey(name: "duration")
  String? duration;

  @JsonKey(name: "number_of_session_per_week")
  String? numberOfSessionPerWeek;

  PlanDetailsEntity({
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
  });
}
