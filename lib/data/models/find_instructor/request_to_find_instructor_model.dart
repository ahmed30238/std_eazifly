import 'package:eazifly_student/domain/entities/find_instructor/request_to_find_instructor_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'request_to_find_instructor_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RequestToFindInstructorModel extends RequestToFindInstructorEntity {
  RequestToFindInstructorModel();

  factory RequestToFindInstructorModel.fromJson(Map<String, dynamic> json) =>
      _$RequestToFindInstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestToFindInstructorModelToJson(this);
}
