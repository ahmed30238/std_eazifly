import 'package:eazifly_student/domain/entities/my_programs/get_user_reports_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_reports_model.g.dart';
@JsonSerializable()
class GetUserReportsModel extends GetUserReportsEntity {
  GetUserReportsModel();

  factory GetUserReportsModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserReportsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserReportsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserReportsDatumModel extends GetUserReportsDatumEntity {
  GetUserReportsDatumModel();

  factory GetUserReportsDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserReportsDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserReportsDatumModelToJson(this);
}
