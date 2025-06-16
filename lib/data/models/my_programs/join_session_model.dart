import 'package:eazifly_student/domain/entities/my_programs/join_session_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'join_session_model.g.dart';

@JsonSerializable(explicitToJson: true)
class JoinSessionModel extends JoinSessionEntity {
  JoinSessionModel();

  factory JoinSessionModel.fromJson(Map<String, dynamic> json) =>
      _$JoinSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$JoinSessionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JoinSessionDataModel extends JoinSessionDataEntity {
  JoinSessionDataModel();

  factory JoinSessionDataModel.fromJson(Map<String, dynamic> json) =>
      _$JoinSessionDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$JoinSessionDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class JoinSessionUserModel extends JoinSessionUserEntity {
  JoinSessionUserModel();

  factory JoinSessionUserModel.fromJson(Map<String, dynamic> json) =>
      _$JoinSessionUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$JoinSessionUserModelToJson(this);
}
