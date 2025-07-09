import 'package:eazifly_student/domain/entities/home/get_home_assigments_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_home_assigments_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetHomeAssignmentsModel extends GetHomeAssignmentsEntity {
  GetHomeAssignmentsModel();

  factory GetHomeAssignmentsModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeAssignmentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeAssignmentsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeAssigmentsDatumModel extends GetHomeAssigmentsDatumEntity {
  GetHomeAssigmentsDatumModel();

  factory GetHomeAssigmentsDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeAssigmentsDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeAssigmentsDatumModelToJson(this);
}
