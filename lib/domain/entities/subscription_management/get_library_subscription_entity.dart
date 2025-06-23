import 'package:eazifly_student/data/models/subscription_management/get_library_subscription_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetLibrarySubscriptionEntity {
  @JsonKey(name: "data")
  GetLibrarySubscriptionDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetLibrarySubscriptionEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetLibrarySubscriptionDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "plan")
  GetLibrarySubscriptionPlanModel? plan;

  @JsonKey(name: "from_date")
  DateTime? fromDate;

  @JsonKey(name: "expire_date")
  DateTime? expireDate;

  GetLibrarySubscriptionDataEntity({
    this.id,
    this.plan,
    this.fromDate,
    this.expireDate,
  });
}

class GetLibrarySubscriptionPlanEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "price")
  int? price;

  @JsonKey(name: "days")
  int? days;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  GetLibrarySubscriptionPlanEntity({
    this.id,
    this.price,
    this.days,
    this.title,
    this.description,
  });
}
