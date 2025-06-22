import 'package:eazifly_student/domain/entities/my_programs/post_assignment_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post_assignment_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PostAssignmentModel extends PostAssignmentEntity {
  PostAssignmentModel();

  factory PostAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$PostAssignmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostAssignmentModelToJson(this);
}
