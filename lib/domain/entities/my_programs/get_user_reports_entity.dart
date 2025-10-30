import 'package:eazifly_student/data/models/my_programs/get_user_reports_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetUserReportsEntity {
  @JsonKey(name: "data")
  List<GetUserReportsDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetUserReportsEntity({this.data, this.status, this.message});
}

class GetUserReportsDatumEntity {
  @JsonKey(name: "report_maker_type")
  String? reportMakerType;

  @JsonKey(name: "report_maker_id")
  String? reportMakerId;

  @JsonKey(name: "report_maker_name")
  String? reportMakerName;

  @JsonKey(name: "report_maker_image")
  String? reportMakerImage;

  @JsonKey(name: "report_for_type")
  String? reportForType;

  @JsonKey(name: "report_for_name")
  String? reportForName;

  @JsonKey(name: "report_for_id")
  String? reportForId;

  @JsonKey(name: "report_for_image")
  String? reportForImage;

  @JsonKey(name: "program")
  String? program;

  @JsonKey(name: "meeting_session_id")
  String? meetingSessionId;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  GetUserReportsDatumEntity({
    this.reportMakerType,
    this.reportMakerId,
    this.reportMakerName,
    this.reportMakerImage,
    this.reportForType,
    this.reportForName,
    this.reportForId,
    this.reportForImage,
    this.program,
    this.meetingSessionId,
    this.createdAt,
  });
}
