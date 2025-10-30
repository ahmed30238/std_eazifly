// cancel_subscription_entity.dart

import 'package:json_annotation/json_annotation.dart';

class CancelSubscriptionEntity {
  @JsonKey(name: "data")
  dynamic data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  CancelSubscriptionEntity({this.data, this.status, this.message});
}
