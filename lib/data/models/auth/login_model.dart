import 'package:eazifly_student/domain/entities/login_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginModel extends LoginEntity {
  LoginModel();

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DataModel extends DataEntity {
  DataModel();

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProgramModel extends ProgramEntity {
  ProgramModel();

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StatusLabelModel extends StatusLabelEntity {
  StatusLabelModel();

  factory StatusLabelModel.fromJson(Map<String, dynamic> json) =>
      _$StatusLabelModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusLabelModelToJson(this);
}
