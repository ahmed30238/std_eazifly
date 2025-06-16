import 'package:eazifly_student/domain/entities/my_programs/get_my_programs_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_my_programs_model.g.dart';

@JsonSerializable()
class GetMyProgramsModel extends GetMyProgramsEntity {
  GetMyProgramsModel();

  factory GetMyProgramsModel.fromJson(Map<String, dynamic> json) =>
      _$GetMyProgramsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyProgramsModelToJson(this);
}

@JsonSerializable()
class MyProgramModel extends MyProgramEntity {
  MyProgramModel();

  factory MyProgramModel.fromJson(Map<String, dynamic> json) =>
      _$MyProgramModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyProgramModelToJson(this);
}

@JsonSerializable()
class ProgramSessionModel extends ProgramSessionEntity {
  ProgramSessionModel();

  factory ProgramSessionModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramSessionModelToJson(this);
}
