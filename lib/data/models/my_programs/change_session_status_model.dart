import 'package:eazifly_student/domain/entities/my_programs/change_session_status_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_session_status_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChangeSessionStatusModel extends ChangeSessionStatusEntity {
  ChangeSessionStatusModel();

  factory ChangeSessionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeSessionStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeSessionStatusModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangeSessionStatusDataModel extends ChangeSessionStatusDataEntity {
  ChangeSessionStatusDataModel();

  factory ChangeSessionStatusDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeSessionStatusDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeSessionStatusDataModelToJson(this);
}

@JsonSerializable()
class ChangeSessionStatusUserModel extends ChangeSessionStatusUserEntity {
  ChangeSessionStatusUserModel();

  factory ChangeSessionStatusUserModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeSessionStatusUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeSessionStatusUserModelToJson(this);
}
