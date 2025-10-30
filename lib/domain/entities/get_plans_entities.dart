import 'package:eazifly_student/data/models/order_and_subscribe/get_plans_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetPlansEntity {
  @JsonKey(name: "data")
  GetPlansDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetPlansEntity({this.data, this.status, this.message});
}

class GetPlansDataEntity {
  @JsonKey(name: "number_of_session_per_week")
  List<String>? numberOfSessionPerWeek;

  @JsonKey(name: "duration")
  List<String>? duration;

  @JsonKey(name: "subscripe_days")
  List<String>? subscripeDays;

  GetPlansDataEntity({
    this.numberOfSessionPerWeek,
    this.duration,
    this.subscripeDays,
  });
}
