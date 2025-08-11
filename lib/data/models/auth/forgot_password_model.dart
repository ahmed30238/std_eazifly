import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/auth/forgot_password_entity.dart';
part 'forgot_password_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ForgotPasswordModel extends ForgotPasswordEntity {
  ForgotPasswordModel();

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForgotPasswordModelToJson(this);
}
