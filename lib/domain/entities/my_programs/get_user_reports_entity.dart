import 'package:eazifly_student/data/models/my_programs/get_user_reports_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetUserReportsEntity {
  @JsonKey(name: "data")
  List<UserReportModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetUserReportsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class UserReportEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "report_maker_type")
  String? reportMakerType;

  @JsonKey(name: "report_maker_name")
  String? reportMakerName;

  @JsonKey(name: "report_maker_image")
  String? reportMakerImage;

  @JsonKey(name: "report_for_type")
  String? reportForType;

  @JsonKey(name: "report_for_name")
  String? reportForName;

  @JsonKey(name: "report_for_image")
  String? reportForImage;

  @JsonKey(name: "program")
  String? program;

  @JsonKey(name: "report_question")
  String? reportQuestion;

  @JsonKey(name: "report_question_answer")
  String? reportQuestionAnswer;

  @JsonKey(name: "note")
  String? note;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  UserReportEntity({
    this.id,
    this.reportMakerType,
    this.reportMakerName,
    this.reportMakerImage,
    this.reportForType,
    this.reportForName,
    this.reportForImage,
    this.program,
    this.reportQuestion,
    this.reportQuestionAnswer,
    this.note,
    this.createdAt,
  });
}
