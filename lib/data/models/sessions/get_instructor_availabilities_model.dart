import 'package:eazifly_student/domain/entities/sessions/get_instructor_availabilities_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_instructor_availabilities_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetInstructorAvailabilitiesModel
    extends GetInstructorAvailabilitiesEntity {
  GetInstructorAvailabilitiesModel();

  factory GetInstructorAvailabilitiesModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetInstructorAvailabilitiesModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetInstructorAvailabilitiesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInstructorAvailabilitieDataModel
    extends GetInstructorAvailabilitieDataEntity {
  GetInstructorAvailabilitieDataModel();

  factory GetInstructorAvailabilitieDataModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetInstructorAvailabilitieDataModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetInstructorAvailabilitieDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetInstructorAvailabilitieDayModel
    extends GetInstructorAvailabilitieDayEntity {
  GetInstructorAvailabilitieDayModel() : super();

  factory GetInstructorAvailabilitieDayModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetInstructorAvailabilitieDayModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetInstructorAvailabilitieDayModelToJson(this);
}
