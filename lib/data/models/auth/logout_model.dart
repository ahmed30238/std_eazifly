import 'package:eazifly_student/domain/entities/notification/auth/logout_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LogoutModel extends LogoutEntity {
  LogoutModel();

  factory LogoutModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutModelToJson(this);
}
