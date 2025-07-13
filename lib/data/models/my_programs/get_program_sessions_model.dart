import 'package:eazifly_student/domain/entities/my_programs/get_program_sessions_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_program_sessions_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProgramSessionsModel extends GetProgramSessionsEntity {
  GetProgramSessionsModel();

  factory GetProgramSessionsModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramSessionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramSessionsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProgramSessionModel extends ProgramSessionEntity {
  ProgramSessionModel();

  factory ProgramSessionModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramSessionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserModel extends UserEntity {
  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProgramSessionsStatusModel extends GetProgramSessionsStatus {
  GetProgramSessionsStatusModel();
  factory GetProgramSessionsStatusModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramSessionsStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramSessionsStatusModelToJson(this);
}
