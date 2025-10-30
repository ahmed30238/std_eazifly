import 'package:eazifly_student/domain/entities/change_instructor/get_change_instructor_reasons_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_change_instructor_reasons_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetChangeInstructorReasonsModel extends GetChangeInstructorReasonsEntity {
  GetChangeInstructorReasonsModel();

  factory GetChangeInstructorReasonsModel.fromJson(Map<String, dynamic> json) =>
      _$GetChangeInstructorReasonsModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetChangeInstructorReasonsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetChangeInstructorReasonsDatumModel
    extends GetChangeInstructorReasonsDatumEntity {
  GetChangeInstructorReasonsDatumModel();

  factory GetChangeInstructorReasonsDatumModel.fromJson(
    Map<String, dynamic> json,
  ) => _$GetChangeInstructorReasonsDatumModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetChangeInstructorReasonsDatumModelToJson(this);
}
