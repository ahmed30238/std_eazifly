import 'dart:convert';
import 'package:eazifly_student/domain/entities/assign_program_review_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'assign_program_review_model.g.dart';

AssignProgramReviewModel assignProgramReviewModelFromJson(String str) =>
    AssignProgramReviewModel.fromJson(json.decode(str));

String assignProgramReviewModelToJson(AssignProgramReviewModel data) =>
    json.encode(data.toJson());

@JsonSerializable(explicitToJson: true)
class AssignProgramReviewModel extends AssignProgramReviewEntity {
  AssignProgramReviewModel();

  factory AssignProgramReviewModel.fromJson(Map<String, dynamic> json) =>
      _$AssignProgramReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssignProgramReviewModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignProgramReviewDataModel extends AssignProgramReviewDataEntity {
  AssignProgramReviewDataModel();

  factory AssignProgramReviewDataModel.fromJson(Map<String, dynamic> json) =>
      _$AssignProgramReviewDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssignProgramReviewDataModelToJson(this);
}
