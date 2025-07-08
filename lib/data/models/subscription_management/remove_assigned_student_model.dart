import 'package:eazifly_student/domain/entities/subscription_management/remove_assigned_student_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remove_assigned_student_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RemoveAssignedStudentModel extends RemoveAssignedStudentEntity {
  RemoveAssignedStudentModel() : super();

  factory RemoveAssignedStudentModel.fromJson(Map<String, dynamic> json) =>
      _$RemoveAssignedStudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$RemoveAssignedStudentModelToJson(this);
}
