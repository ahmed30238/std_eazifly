import 'package:eazifly_student/data/models/subscription_management/upgrade_order_model.dart';
import 'package:json_annotation/json_annotation.dart';

class UpgradeOrderEntity {
  @JsonKey(name: "data")
  UpgradeOrderDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  UpgradeOrderEntity({
    this.data,
    this.status,
    this.message,
  });
}

class UpgradeOrderDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "user")
  UpgradeOrderUserModel? user;

  @JsonKey(name: "total_order_price")
  int? totalOrderPrice;

  @JsonKey(name: "total_after_discount")
  int? totalAfterDiscount;

  @JsonKey(name: "currency")
  String? currency;

  @JsonKey(name: "status")
  UpgradeOrderStatusModel? status;

  @JsonKey(name: "type")
  UpgradeOrderStatusModel? type;

  @JsonKey(name: "subscription_type")
  String? subscriptionType;

  @JsonKey(name: "used_coupon")
  bool? usedCoupon;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "order_details")
  List<UpgradeOrderDetailModel>? orderDetails;

  UpgradeOrderDataEntity({
    this.id,
    this.user,
    this.totalOrderPrice,
    this.totalAfterDiscount,
    this.currency,
    this.status,
    this.type,
    this.subscriptionType,
    this.usedCoupon,
    this.createdAt,
    this.orderDetails,
  });
}

class UpgradeOrderDetailEntity {
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

  UpgradeOrderDetailEntity({
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

class UpgradeOrderStatusEntity {
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "color")
  String? color;

  UpgradeOrderStatusEntity({
    this.label,
    this.color,
  });
}

class UpgradeOrderUserEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;

  UpgradeOrderUserEntity({
    this.id,
    this.name,
    this.image,
  });
}