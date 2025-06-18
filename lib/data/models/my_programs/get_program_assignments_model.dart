
import 'package:eazifly_student/domain/entities/my_programs/get_program_assignments_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_program_assignments_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProgramAssignmentsModel extends GetProgramAssignmentsEntity {
  GetProgramAssignmentsModel();

  factory GetProgramAssignmentsModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramAssignmentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramAssignmentsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProgramAssignmentModel extends ProgramAssignmentEntity {
  ProgramAssignmentModel();

  factory ProgramAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramAssignmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramAssignmentModelToJson(this);
}
