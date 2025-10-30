import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/auth/reset_password_entity.dart';

part 'reset_password_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ResetPasswordModel extends ResetPasswordEntity {
  ResetPasswordModel({super.data, super.status, super.message});

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordModelToJson(this);
}
