import 'package:eazifly_student/domain/entities/get_program_payment_methods_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_program_payment_methods_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProgramPaymentMethodsModel extends GetProgramPaymentMethodsEntity {
  GetProgramPaymentMethodsModel();

  factory GetProgramPaymentMethodsModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramPaymentMethodsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramPaymentMethodsModelToJson(this);
}

@JsonSerializable()
class ProgramPaymentMethodModel extends ProgramPaymentMethodEntity {
  ProgramPaymentMethodModel();

  factory ProgramPaymentMethodModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramPaymentMethodModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramPaymentMethodModelToJson(this);
}
