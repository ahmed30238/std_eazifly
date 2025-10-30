import 'package:eazifly_student/data/models/order_and_subscribe/filter_plans_model.dart';
import 'package:json_annotation/json_annotation.dart';

class FilterPlansEntity {
  @JsonKey(name: "data")
  FilterPlansDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  FilterPlansEntity({this.data, this.status, this.message});
}

class FilterPlansDataEntity {
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

  FilterPlansDataEntity({
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
