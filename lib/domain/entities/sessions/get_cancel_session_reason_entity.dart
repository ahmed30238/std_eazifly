import 'package:eazifly_student/data/models/sessions/get_cancel_session_reason_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetCancelSessionReasonEntity {
  @JsonKey(name: "data")
  List<GetCancelSessionReasonDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetCancelSessionReasonEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetCancelSessionReasonDatumEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;

  GetCancelSessionReasonDatumEntity({
    this.id,
    this.title,
  });
}
