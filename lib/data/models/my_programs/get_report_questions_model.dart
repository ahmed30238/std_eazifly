import 'package:eazifly_student/domain/entities/my_programs/get_report_questions_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_report_questions_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetReportQuestionsModel extends GetReportQuestionsEntity {
  GetReportQuestionsModel();

  factory GetReportQuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$GetReportQuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetReportQuestionsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReportQuestionsDatumModel extends GetReportQuestionsDatumEntity {
  GetReportQuestionsDatumModel();

  factory GetReportQuestionsDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetReportQuestionsDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetReportQuestionsDatumModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReportQuestionModel extends ReportQuestionEntity {
  ReportQuestionModel();

  factory ReportQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ReportQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportQuestionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReportQuestionsOptionModel extends GetReportQuestionsOptionEntity {
  GetReportQuestionsOptionModel();

  factory GetReportQuestionsOptionModel.fromJson(Map<String, dynamic> json) =>
      _$GetReportQuestionsOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetReportQuestionsOptionModelToJson(this);
}
