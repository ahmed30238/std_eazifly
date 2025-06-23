import 'package:eazifly_student/domain/entities/subscription_management/show_plan_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'show_plan_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowPlanModel extends ShowPlanEntity {
  ShowPlanModel();

  factory ShowPlanModel.fromJson(Map<String, dynamic> json) =>
      _$ShowPlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowPlanModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShowPlanDataModel extends DataEntity {
  ShowPlanDataModel();

  factory ShowPlanDataModel.fromJson(Map<String, dynamic> json) =>
      _$ShowPlanDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowPlanDataModelToJson(this);
}
