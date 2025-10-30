import 'package:eazifly_student/data/models/user/copoun_history_model.dart';
import 'package:json_annotation/json_annotation.dart';

class CopounHistoryEntity {
  @JsonKey(name: "data")
  List<CopounHistoryDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  CopounHistoryEntity({this.data, this.status, this.message});
}

class CopounHistoryDatumEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "order_id")
  int? orderId;
  @JsonKey(name: "coupon_id")
  int? couponId;
  @JsonKey(name: "bonus")
  int? bonus;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  dynamic updatedAt;

  CopounHistoryDatumEntity({
    this.id,
    this.userId,
    this.orderId,
    this.couponId,
    this.bonus,
    this.type,
    this.createdAt,
    this.updatedAt,
  });
}
