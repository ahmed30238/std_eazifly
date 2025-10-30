import 'package:eazifly_student/domain/entities/change_instructor/change_instructor_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_instructor_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChangeInstructorModel extends ChangeInstructorEntity {
  ChangeInstructorModel();

  factory ChangeInstructorModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeInstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeInstructorModelToJson(this);
}
