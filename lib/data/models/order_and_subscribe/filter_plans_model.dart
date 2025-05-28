import 'package:eazifly_student/domain/entities/filter_plan_entities.dart';
import 'package:json_annotation/json_annotation.dart';


part 'filter_plans_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FilterPlansModel extends FilterPlansEntity {
  FilterPlansModel();

  factory FilterPlansModel.fromJson(Map<String, dynamic> json) =>
      _$FilterPlansModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterPlansModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FilterPlansDataModel extends FilterPlansDataEntity {
  FilterPlansDataModel();

  factory FilterPlansDataModel.fromJson(Map<String, dynamic> json) =>
      _$FilterPlansDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$FilterPlansDataModelToJson(this);
}
