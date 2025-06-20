import 'package:eazifly_student/domain/entities/my_programs/get_assignment_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_assignment_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAssignmentDetailsModel extends GetAssignmentDetailsEntity {
  GetAssignmentDetailsModel();

  factory GetAssignmentDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAssignmentDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAssignmentDetailsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignmentDetailsDataModel extends AssignmentDetailsDataEntity {
  AssignmentDetailsDataModel();

  factory AssignmentDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$AssignmentDetailsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AssignmentDetailsDataModelToJson(this);
}
