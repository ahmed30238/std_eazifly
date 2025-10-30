import 'package:eazifly_student/domain/entities/get_instructors_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_instructors_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetInstructorsModel extends GetInstructorsEntity {
  GetInstructorsModel();

  factory GetInstructorsModel.fromJson(Map<String, dynamic> json) =>
      _$GetInstructorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetInstructorsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInstructorsInstructorModel extends GetInstructorsInstructorEntity {
  GetInstructorsInstructorModel();

  factory GetInstructorsInstructorModel.fromJson(Map<String, dynamic> json) =>
      _$GetInstructorsInstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetInstructorsInstructorModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInstructorsInstructorSpecializationsModel
    extends GetInstructorsInstructorSpecializationsEntity {
  GetInstructorsInstructorSpecializationsModel();

  factory GetInstructorsInstructorSpecializationsModel.fromJson(
    Map<String, dynamic> json,
  ) => _$GetInstructorsInstructorSpecializationsModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetInstructorsInstructorSpecializationsModelToJson(this);
}
