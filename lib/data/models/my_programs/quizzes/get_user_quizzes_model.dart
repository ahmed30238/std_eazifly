import 'package:eazifly_student/domain/entities/my_programs/quizzes/get_user_quizzes_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_quizzes_model.g.dart';


@JsonSerializable(explicitToJson: true)
class GetUserQuizzesModel extends GetUserQuizzesEntity {
  GetUserQuizzesModel();

  factory GetUserQuizzesModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserQuizzesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserQuizzesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuizDatumModel extends QuizDatumEntity {
  QuizDatumModel();

  factory QuizDatumModel.fromJson(Map<String, dynamic> json) =>
      _$QuizDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuizDatumModelToJson(this);
}
