import 'package:eazifly_student/data/models/order_and_subscribe/check_copoun_model.dart';
import 'package:json_annotation/json_annotation.dart';

class CheckCopounEntity {
  @JsonKey(name: "data")
  CheckCopounDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  CheckCopounEntity({
    this.data,
    this.status,
    this.message,
  });
}

class CheckCopounDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "discount")
  int? discount;

  @JsonKey(name: "discount_type")
  String? discountType;

  @JsonKey(name: "expire_date")
  DateTime? expireDate;

  @JsonKey(name: "times_used")
  int? timesUsed;

  @JsonKey(name: "already_used")
  int? alreadyUsed;

  CheckCopounDataEntity({
    this.id,
    this.code,
    this.discount,
    this.discountType,
    this.expireDate,
    this.timesUsed,
    this.alreadyUsed,
  });
}
