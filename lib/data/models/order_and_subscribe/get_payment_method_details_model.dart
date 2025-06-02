import 'package:eazifly_student/data/models/order_and_subscribe/get_program_payment_methods_model.dart';
import 'package:eazifly_student/domain/entities/get_payment_method_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_program_payment_methods_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_payment_method_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPaymentMethodDetailsModel extends GetPaymentMethodDetailsEntity {
  GetPaymentMethodDetailsModel();

  factory GetPaymentMethodDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentMethodDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentMethodDetailsModelToJson(this);
}

@JsonSerializable()
class PaymentMethodDetailsModel extends ProgramPaymentMethodEntity {
  PaymentMethodDetailsModel();

  factory PaymentMethodDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodDetailsModelToJson(this);
}
