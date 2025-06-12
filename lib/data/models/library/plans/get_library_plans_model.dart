import 'package:eazifly_student/domain/entities/get_library_plans_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_library_plans_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetLibraryPlansModel extends GetLibraryPlansEntity {
  GetLibraryPlansModel();

  factory GetLibraryPlansModel.fromJson(Map<String, dynamic> json) =>
      _$GetLibraryPlansModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetLibraryPlansModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LibraryPlanModel extends LibraryPlanEntity {
  LibraryPlanModel();

  factory LibraryPlanModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryPlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryPlanModelToJson(this);
}
