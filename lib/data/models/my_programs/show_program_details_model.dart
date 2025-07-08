import 'package:eazifly_student/domain/entities/my_programs/show_program_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'show_program_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowProgramDetailsModel extends ShowProgramDetailsEntity {
  ShowProgramDetailsModel();

  factory ShowProgramDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ShowProgramDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowProgramDetailsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShowProgramDataModel extends ShowProgramDataEntity {
  ShowProgramDataModel();

  factory ShowProgramDataModel.fromJson(Map<String, dynamic> json) =>
      _$ShowProgramDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowProgramDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NextSessionModel extends NextSessionEntity {
  NextSessionModel();

  factory NextSessionModel.fromJson(Map<String, dynamic> json) =>
      _$NextSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$NextSessionModelToJson(this);
}
