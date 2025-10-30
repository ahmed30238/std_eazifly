import 'package:eazifly_student/data/models/order_and_subscribe/get_program_payment_methods_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetProgramPaymentMethodsEntity {
  @JsonKey(name: "data")
  List<ProgramPaymentMethodModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetProgramPaymentMethodsEntity({this.data, this.status, this.message});
}

class ProgramPaymentMethodEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "how_to_use")
  dynamic howToUse;
  @JsonKey(name: "pay_on")
  String? payOn;
  @JsonKey(name: "program_id")
  String? programId;

  ProgramPaymentMethodEntity({
    this.id,
    this.title,
    this.description,
    this.image,
    this.howToUse,
    this.payOn,
    this.programId,
  });
}
