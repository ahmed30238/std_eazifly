import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/auth/register_entities.dart';

part 'register_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterModel extends RegisterEntity {
  RegisterModel();

  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterDataModel extends RegisterDataEntity {
  RegisterDataModel();

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterStatusLabelModel extends RegisterStatusLabelEntity {
  RegisterStatusLabelModel();

  factory RegisterStatusLabelModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterStatusLabelModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterStatusLabelModelToJson(this);
}
