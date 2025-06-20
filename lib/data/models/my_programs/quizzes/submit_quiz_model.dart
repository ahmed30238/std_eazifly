import 'package:eazifly_student/domain/entities/my_programs/quizzes/submit_quiz_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'submit_quiz_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SubmitQuizModel extends SubmitQuizEntity {
  SubmitQuizModel();

  factory SubmitQuizModel.fromJson(Map<String, dynamic> json) =>
      _$SubmitQuizModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubmitQuizModelToJson(this);
}
