import 'package:eazifly_student/domain/entities/my_programs/quizzes/get_quiz_questions_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_quiz_questions_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetQuizQuestionsModel extends GetQuizQuestionsEntity {
  GetQuizQuestionsModel();

  factory GetQuizQuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$GetQuizQuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetQuizQuestionsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetQuizQuestionsDataModel extends GetQuizQuestionsDataEntity {
  GetQuizQuestionsDataModel();

  factory GetQuizQuestionsDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetQuizQuestionsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetQuizQuestionsDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetQuizQuestionsQuestionModel extends GetQuizQuestionsQuestionEntity {
  GetQuizQuestionsQuestionModel();

  factory GetQuizQuestionsQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$GetQuizQuestionsQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetQuizQuestionsQuestionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetQuizQuestionsOptionModel extends GetQuizQuestionsOptionEntity {
  GetQuizQuestionsOptionModel();

  factory GetQuizQuestionsOptionModel.fromJson(Map<String, dynamic> json) =>
      _$GetQuizQuestionsOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetQuizQuestionsOptionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetQuizQuestionsUserAnswerModel extends GetQuizQuestionsUserAnswerEntity {
  GetQuizQuestionsUserAnswerModel();

  factory GetQuizQuestionsUserAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$GetQuizQuestionsUserAnswerModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetQuizQuestionsUserAnswerModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetQuizQuestionsQuestionAnswerModel
    extends GetQuizQuestionsQuestionAnswerEntity {
  GetQuizQuestionsQuestionAnswerModel();

  factory GetQuizQuestionsQuestionAnswerModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetQuizQuestionsQuestionAnswerModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetQuizQuestionsQuestionAnswerModelToJson(this);
}
