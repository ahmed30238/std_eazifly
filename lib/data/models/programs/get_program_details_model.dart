
import 'package:eazifly_student/data/models/programs/get_programs_model.dart';
import 'package:eazifly_student/domain/entities/get_program_details_entities.dart';
import 'package:eazifly_student/domain/entities/get_programs_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_program_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProgramDetailsModel extends GetProgramDetailsEntity {
  GetProgramDetailsModel();

  factory GetProgramDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramDetailsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProgramDetailsDataModel extends GetProgramsProgramEntity {
  ProgramDetailsDataModel();

  factory ProgramDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramDetailsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramDetailsDataModelToJson(this);
}