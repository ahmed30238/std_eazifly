import 'dart:convert';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_programs_model.g.dart';

GetProgramsModel getProgramsModelFromJson(String str) =>
    GetProgramsModel.fromJson(json.decode(str));

String getProgramsModelToJson(GetProgramsModel data) =>
    json.encode(data.toJson());

@JsonSerializable(explicitToJson: true)
class GetProgramsModel extends GetProgramsEntity {
  GetProgramsModel();

  factory GetProgramsModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProgramModel extends GetProgramsProgramEntity {
  ProgramModel();

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class InstructorModel extends InstructorEntity {
  InstructorModel();

  factory InstructorModel.fromJson(Map<String, dynamic> json) =>
      _$InstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$InstructorModelToJson(this);
}

@JsonSerializable()
class SpecializationModel extends SpecializationEntity {
  SpecializationModel();

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationModelToJson(this);
}

@JsonSerializable()
class ReviewModel extends ReviewEntity {
  ReviewModel();

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
