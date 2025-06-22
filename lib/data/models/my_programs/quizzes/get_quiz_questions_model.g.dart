// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_quiz_questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuizQuestionsModel _$GetQuizQuestionsModelFromJson(
        Map<String, dynamic> json) =>
    GetQuizQuestionsModel()
      ..data = json['data'] == null
          ? null
          : GetQuizQuestionsDataModel.fromJson(
              json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetQuizQuestionsModelToJson(
        GetQuizQuestionsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

GetQuizQuestionsDataModel _$GetQuizQuestionsDataModelFromJson(
        Map<String, dynamic> json) =>
    GetQuizQuestionsDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..level = json['level'] as String?
      ..title = json['title'] as String?
      ..numberOfQuestions = json['number_of_questions'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..programId = (json['program_id'] as num?)?.toInt()
      ..instructorId = (json['instructor_id'] as num?)?.toInt()
      ..questions = (json['questions'] as List<dynamic>?)
          ?.map((e) =>
              GetQuizQuestionsQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..userAnswer = json['user_answer'] == null
          ? null
          : GetQuizQuestionsUserAnswerModel.fromJson(
              json['user_answer'] as Map<String, dynamic>);

Map<String, dynamic> _$GetQuizQuestionsDataModelToJson(
        GetQuizQuestionsDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'title': instance.title,
      'number_of_questions': instance.numberOfQuestions,
      'created_at': instance.createdAt?.toIso8601String(),
      'program_id': instance.programId,
      'instructor_id': instance.instructorId,
      'questions': instance.questions?.map((e) => e.toJson()).toList(),
      'user_answer': instance.userAnswer?.toJson(),
    };

GetQuizQuestionsQuestionModel _$GetQuizQuestionsQuestionModelFromJson(
        Map<String, dynamic> json) =>
    GetQuizQuestionsQuestionModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..type = json['type'] as String?
      ..level = json['level'] as String?
      ..mark = json['mark'] as String?
      ..status = json['status'] as String?
      ..options = (json['options'] as List<dynamic>?)
          ?.map((e) =>
              GetQuizQuestionsOptionModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetQuizQuestionsQuestionModelToJson(
        GetQuizQuestionsQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'level': instance.level,
      'mark': instance.mark,
      'status': instance.status,
      'options': instance.options?.map((e) => e.toJson()).toList(),
    };

GetQuizQuestionsOptionModel _$GetQuizQuestionsOptionModelFromJson(
        Map<String, dynamic> json) =>
    GetQuizQuestionsOptionModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..optionStatus = json['option_status'] as String?;

Map<String, dynamic> _$GetQuizQuestionsOptionModelToJson(
        GetQuizQuestionsOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'option_status': instance.optionStatus,
    };

GetQuizQuestionsUserAnswerModel _$GetQuizQuestionsUserAnswerModelFromJson(
        Map<String, dynamic> json) =>
    GetQuizQuestionsUserAnswerModel()
      ..status = json['status'] as String?
      ..totalMark = json['total_mark'] as String?
      ..fullMark = json['full_mark'] as String?
      ..questionAnswer = (json['question_answer'] as List<dynamic>?)
          ?.map((e) => GetQuizQuestionsQuestionAnswerModel.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetQuizQuestionsUserAnswerModelToJson(
        GetQuizQuestionsUserAnswerModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'total_mark': instance.totalMark,
      'full_mark': instance.fullMark,
      'question_answer':
          instance.questionAnswer?.map((e) => e.toJson()).toList(),
    };

GetQuizQuestionsQuestionAnswerModel
    _$GetQuizQuestionsQuestionAnswerModelFromJson(Map<String, dynamic> json) =>
        GetQuizQuestionsQuestionAnswerModel()
          ..id = (json['id'] as num?)?.toInt()
          ..mark = json['mark'] as String?
          ..questionId = json['question_id'] as String?
          ..questionOptionId = json['question_option_id'] as String?
          ..answer = json['answer'];

Map<String, dynamic> _$GetQuizQuestionsQuestionAnswerModelToJson(
        GetQuizQuestionsQuestionAnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mark': instance.mark,
      'question_id': instance.questionId,
      'question_option_id': instance.questionOptionId,
      'answer': instance.answer,
    };
