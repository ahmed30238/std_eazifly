// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_report_questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReportQuestionsModel _$GetReportQuestionsModelFromJson(
        Map<String, dynamic> json) =>
    GetReportQuestionsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetReportQuestionsDatumModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetReportQuestionsModelToJson(
        GetReportQuestionsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetReportQuestionsDatumModel _$GetReportQuestionsDatumModelFromJson(
        Map<String, dynamic> json) =>
    GetReportQuestionsDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..program = json['program'] as String?
      ..reportQuestion = json['report_question'] == null
          ? null
          : ReportQuestionModel.fromJson(
              json['report_question'] as Map<String, dynamic>)
      ..reportQuestionAnswerId = json['report_question_answer_id'] as String?
      ..answer = json['answer'] as String?
      ..note = json['note'] as String?;

Map<String, dynamic> _$GetReportQuestionsDatumModelToJson(
        GetReportQuestionsDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program': instance.program,
      'report_question': instance.reportQuestion?.toJson(),
      'report_question_answer_id': instance.reportQuestionAnswerId,
      'answer': instance.answer,
      'note': instance.note,
    };

ReportQuestionModel _$ReportQuestionModelFromJson(Map<String, dynamic> json) =>
    ReportQuestionModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..type = json['type'] as String?
      ..options = (json['options'] as List<dynamic>?)
          ?.map((e) =>
              GetReportQuestionsOptionModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ReportQuestionModelToJson(
        ReportQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'options': instance.options?.map((e) => e.toJson()).toList(),
    };

GetReportQuestionsOptionModel _$GetReportQuestionsOptionModelFromJson(
        Map<String, dynamic> json) =>
    GetReportQuestionsOptionModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?;

Map<String, dynamic> _$GetReportQuestionsOptionModelToJson(
        GetReportQuestionsOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
