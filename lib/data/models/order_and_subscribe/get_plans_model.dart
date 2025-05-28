import 'package:eazifly_student/domain/entities/get_plans_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_plans_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPlansModel extends GetPlansEntity {
  GetPlansModel();

  factory GetPlansModel.fromJson(Map<String, dynamic> json) =>
      _$GetPlansModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPlansModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPlansDataModel extends GetPlansDataEntity {
  GetPlansDataModel();

  factory GetPlansDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetPlansDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPlansDataModelToJson(this);
}
