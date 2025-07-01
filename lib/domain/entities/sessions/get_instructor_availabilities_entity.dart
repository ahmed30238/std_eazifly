import 'package:eazifly_student/data/models/sessions/get_instructor_availabilities_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetInstructorAvailabilitiesEntity {
  @JsonKey(name: "data")
  GetInstructorAvailabilitieDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetInstructorAvailabilitiesEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetInstructorAvailabilitieDataEntity {
  @JsonKey(name: "Saturday")
  List<GetInstructorAvailabilitieDayModel>? saturday;
  @JsonKey(name: "Sunday")
  List<GetInstructorAvailabilitieDayModel>? sunday;
  @JsonKey(name: "Monday")
  List<GetInstructorAvailabilitieDayModel>? monday;
  @JsonKey(name: "Tuesday")
  List<GetInstructorAvailabilitieDayModel>? tuesday;
  @JsonKey(name: "Wednesday")
  List<GetInstructorAvailabilitieDayModel>? wednesday;
  @JsonKey(name: "Thursday")
  List<GetInstructorAvailabilitieDayModel>? thursday;
  @JsonKey(name: "Friday")
  List<GetInstructorAvailabilitieDayModel>? friday;

  GetInstructorAvailabilitieDataEntity({
    this.saturday,
    this.sunday,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
  });
}

class GetInstructorAvailabilitieDayEntity {
  @JsonKey(name: "start_time")
  String? startTime;
  @JsonKey(name: "end_time")
  String? endTime;
  @JsonKey(name: "full_date")
  DateTime? fullDate;

  GetInstructorAvailabilitieDayEntity({
    this.startTime,
    this.endTime,
    this.fullDate,
  });
}