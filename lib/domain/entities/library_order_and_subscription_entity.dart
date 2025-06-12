import 'package:eazifly_student/data/models/library/library_order_and_subscription_model.dart';
import 'package:json_annotation/json_annotation.dart';

class LibraryOrderAndSubscriptionEntity {
  @JsonKey(name: "data")
  LibraryOrderDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  LibraryOrderAndSubscriptionEntity({
    this.data,
    this.status,
    this.message,
  });
}

class LibraryOrderDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "order_type")
  String? orderType;

  LibraryOrderDataEntity({
    this.id,
    this.price,
    this.image,
    this.status,
    this.orderType,
  });
}
