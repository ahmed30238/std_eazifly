import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/add_weekly_appointments_model.dart';
import 'package:json_annotation/json_annotation.dart';

class AddWeeklyAppontmentsEntity {
  @JsonKey(name: "data")
  List<AddWeeklyAppontmentsDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  AddWeeklyAppontmentsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class AddWeeklyAppontmentsDatumEntity {
  @JsonKey(name: "start")
  DateTime? start;

  @JsonKey(name: "end")
  DateTime? end;

  AddWeeklyAppontmentsDatumEntity({
    this.start,
    this.end,
  });
}
