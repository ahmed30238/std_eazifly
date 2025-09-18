import 'package:eazifly_student/data/models/order_and_subscribe/get_plan_with_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetPlansWithDetailsEntity {
  @JsonKey(name: "data")
  List<PlanDetailsModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetPlansWithDetailsEntity({this.data, this.status, this.message});
}

class PlanDetailsEntity {
  static int? customInt(val) => int.tryParse(val?.toString() ?? "");

  /*


*/

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
  @JsonKey(name: "subscripe_days", fromJson: customInt)
  int? subscripeDays;

  @JsonKey(name: "duration")
  String? duration;

  @JsonKey(name: "number_of_session_per_week")
  String? numberOfSessionPerWeek;

  @JsonKey(name: "is_special_plan")
  bool? isSpecialPlan;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "plan_title")
  String? planTitle;

  @JsonKey(name: "subscription_plan")
  String? subscriptionPlan;

  @JsonKey(name: "title_ar")
  String? titleAr;

  @JsonKey(name: "description_ar")
  String? descriptionAr;

  @JsonKey(name: "label_ar")
  String? labelAr;

  @JsonKey(name: "title_en")
  String? titleEn;

  @JsonKey(name: "description_en")
  String? descriptionEn;

  @JsonKey(name: "label_en")
  String? labelEn;

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
    this.isSpecialPlan,
    this.type,
    this.planTitle,
    this.subscriptionPlan,
    this.titleAr,
    this.descriptionAr,
    this.labelAr,
    this.titleEn,
    this.descriptionEn,
    this.labelEn,
  });
}
