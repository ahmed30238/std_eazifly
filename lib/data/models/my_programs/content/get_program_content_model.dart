import 'package:eazifly_student/domain/entities/my_programs/content/get_program_content_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_program_content_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProgramContentModel extends GetProgramContentEntity {
  GetProgramContentModel();

  factory GetProgramContentModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramContentModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProgramContentDatumModel extends ProgramContentDatumEntity {
  ProgramContentDatumModel();

  factory ProgramContentDatumModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramContentDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramContentDatumModelToJson(this);
}



