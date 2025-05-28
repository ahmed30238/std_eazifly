import 'package:eazifly_student/domain/entities/get_plan_with_details_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_plan_with_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPlansWithDetailsModel extends GetPlansWithDetailsEntity {
  GetPlansWithDetailsModel();

  factory GetPlansWithDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$GetPlansWithDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPlansWithDetailsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PlanDetailsModel extends PlanDetailsEntity {
  PlanDetailsModel();

  factory PlanDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PlanDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlanDetailsModelToJson(this);
}
