import 'package:eazifly_student/data/models/change_instructor/get_remaining_program_sessions_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetRemainingProgramSessionsEntity {
  @JsonKey(name: "data")
  List<GetRemainigProgramSessionsDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetRemainingProgramSessionsEntity({this.data, this.status, this.message});
}

class GetRemainigProgramSessionsDatumEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "start")
  DateTime? start;
  @JsonKey(name: "end")
  DateTime? end;

  GetRemainigProgramSessionsDatumEntity({this.id, this.start, this.end});
}
