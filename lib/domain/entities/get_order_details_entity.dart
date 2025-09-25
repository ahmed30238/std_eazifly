import 'package:eazifly_student/data/models/order_and_subscribe/assign_appointments/get_order_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetOrderDetailsEntity {
  @JsonKey(name: "data")
  GetOrderDetailsDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetOrderDetailsEntity({this.data, this.status, this.message});
}

int? customInt(val) => int.tryParse(val?.toString() ?? "");

class GetOrderDetailsDataEntity {
  @JsonKey(name: "subscripe_days")
  String? subscripeDays;

  @JsonKey(name: "duration")
  String? duration;

  @JsonKey(name: "number_of_session_per_week")
  String? numberOfSessionPerWeek;

  @JsonKey(name: "start_date")
  dynamic startDate;

  @JsonKey(name: "number_of_sessions")
  int? numberOfSessions;

  @JsonKey(name: "program_ids")
  List<String>? programIds;
  @JsonKey(name: "order_student_number", fromJson: customInt)
  int? orderStudentNumber;
  @JsonKey(name: "number_of_subscriptions", fromJson: customInt)
  int? numberOfSubscriptions;

  GetOrderDetailsDataEntity({
    this.subscripeDays,
    this.duration,
    this.numberOfSessionPerWeek,
    this.startDate,
    this.numberOfSessions,
    this.programIds,
    this.numberOfSubscriptions,
    this.orderStudentNumber,
  });
}
