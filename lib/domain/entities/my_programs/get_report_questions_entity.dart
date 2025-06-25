import 'package:eazifly_student/data/models/my_programs/get_report_questions_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetReportQuestionsEntity {
  @JsonKey(name: "data")
  List<GetReportQuestionsDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetReportQuestionsEntity({this.data, this.status, this.message});
}

class GetReportQuestionsDatumEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "program")
  String? program;

  @JsonKey(name: "report_question")
  ReportQuestionModel? reportQuestion;

  @JsonKey(name: "report_question_answer_id")
  String? reportQuestionAnswerId;

  @JsonKey(name: "answer")
  String? answer;

  @JsonKey(name: "note")
  String? note;

  GetReportQuestionsDatumEntity({
    this.id,
    this.program,
    this.reportQuestion,
    this.reportQuestionAnswerId,
    this.answer,
    this.note,
  });
}

class ReportQuestionEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "options")
  List<GetReportQuestionsOptionModel>? options;

  ReportQuestionEntity({this.id, this.title, this.type, this.options});
}

class GetReportQuestionsOptionEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  GetReportQuestionsOptionEntity({this.id, this.title});
}
