// get_quiz_questions_entity.dart

import 'package:eazifly_student/data/models/my_programs/quizzes/get_quiz_questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetQuizQuestionsEntity {
  @JsonKey(name: "data")
  GetQuizQuestionsDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetQuizQuestionsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetQuizQuestionsDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "level")
  String? level;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "number_of_questions")
  String? numberOfQuestions;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "program_id")
  int? programId;

  @JsonKey(name: "instructor_id")
  int? instructorId;

  @JsonKey(name: "questions")
  List<GetQuizQuestionsQuestionModel>? questions;

  @JsonKey(name: "user_answer")
  GetQuizQuestionsUserAnswerModel? userAnswer;

  GetQuizQuestionsDataEntity({
    this.id,
    this.level,
    this.title,
    this.numberOfQuestions,
    this.createdAt,
    this.programId,
    this.instructorId,
    this.questions,
    this.userAnswer,
  });
}

class GetQuizQuestionsQuestionEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "level")
  String? level;

  @JsonKey(name: "mark")
  String? mark;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "options")
  List<GetQuizQuestionsOptionModel>? options;

  GetQuizQuestionsQuestionEntity({
    this.id,
    this.title,
    this.type,
    this.level,
    this.mark,
    this.status,
    this.options,
  });
}

class GetQuizQuestionsOptionEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "option_status")
  String? optionStatus;

  GetQuizQuestionsOptionEntity({
    this.id,
    this.title,
    this.optionStatus,
  });
}

class GetQuizQuestionsUserAnswerEntity {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "total_mark")
  String? totalMark;

  @JsonKey(name: "full_mark")
  String? fullMark;

  @JsonKey(name: "question_answer")
  List<GetQuizQuestionsQuestionAnswerModel>? questionAnswer;

  GetQuizQuestionsUserAnswerEntity({
    this.status,
    this.totalMark,
    this.fullMark,
    this.questionAnswer,
  });
}

class GetQuizQuestionsQuestionAnswerEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "mark")
  String? mark;

  @JsonKey(name: "question_id")
  String? questionId;

  @JsonKey(name: "question_option_id")
  String? questionOptionId;

  @JsonKey(name: "answer")
  dynamic answer;

  GetQuizQuestionsQuestionAnswerEntity({
    this.id,
    this.mark,
    this.questionId,
    this.questionOptionId,
    this.answer,
  });
}
