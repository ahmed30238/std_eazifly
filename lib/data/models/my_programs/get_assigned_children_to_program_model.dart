// MODEL CLASSES

import 'package:eazifly_student/domain/entities/my_programs/get_assigned_children_to_program_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_assigned_children_to_program_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAssignedChildrenToProgramModel
    extends GetAssignedChildrenToProgramEntity {
  GetAssignedChildrenToProgramModel();

  factory GetAssignedChildrenToProgramModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetAssignedChildrenToProgramModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAssignedChildrenToProgramModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAssignedChildrenToProgramDatumModel
    extends GetAssignedChildrenToProgramDatumEntity {
  GetAssignedChildrenToProgramDatumModel();

  factory GetAssignedChildrenToProgramDatumModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetAssignedChildrenToProgramDatumModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAssignedChildrenToProgramDatumModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAssignedChildrenToProgramProgramModel
    extends GetAssignedChildrenToProgramProgramEntity {
  GetAssignedChildrenToProgramProgramModel();

  factory GetAssignedChildrenToProgramProgramModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetAssignedChildrenToProgramProgramModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAssignedChildrenToProgramProgramModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetAssignedChildrenToProgramStatusLabelModel
    extends GetAssignedChildrenToProgramStatusLabelEntity {
  GetAssignedChildrenToProgramStatusLabelModel();

  factory GetAssignedChildrenToProgramStatusLabelModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetAssignedChildrenToProgramStatusLabelModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetAssignedChildrenToProgramStatusLabelModelToJson(this);
}
