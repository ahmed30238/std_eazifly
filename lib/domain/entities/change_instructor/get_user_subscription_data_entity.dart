import 'package:eazifly_student/data/models/change_instructor/get_user_subscription_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetUserSubscriptionDataEntity {
  @JsonKey(name: "data")
  GetUserSubscriptionDataDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetUserSubscriptionDataEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetUserSubscriptionDataDataEntity {
  @JsonKey(name: "subscripe_days")
  String? subscripeDays;
  @JsonKey(name: "duration")
  String? duration;
  @JsonKey(name: "number_of_session_per_week")
  String? numberOfSessionPerWeek;
  @JsonKey(name: "start_date")
  DateTime? startDate;
  @JsonKey(name: "number_of_sessions")
  int? numberOfSessions;

  GetUserSubscriptionDataDataEntity({
    this.subscripeDays,
    this.duration,
    this.numberOfSessionPerWeek,
    this.startDate,
    this.numberOfSessions,
  });
}
