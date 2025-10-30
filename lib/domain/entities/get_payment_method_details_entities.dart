import 'package:eazifly_student/data/models/order_and_subscribe/get_program_payment_methods_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetPaymentMethodDetailsEntity {
  @JsonKey(name: "data")
  ProgramPaymentMethodModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetPaymentMethodDetailsEntity({this.data, this.status, this.message});
}
