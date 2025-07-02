// ============ get_instructor_availabilities_entity.dart ============
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

  // Helper method to check if there are any available times
  bool get hasAvailabilities {
    return (saturday?.isNotEmpty ?? false) ||
        (sunday?.isNotEmpty ?? false) ||
        (monday?.isNotEmpty ?? false) ||
        (tuesday?.isNotEmpty ?? false) ||
        (wednesday?.isNotEmpty ?? false) ||
        (thursday?.isNotEmpty ?? false) ||
        (friday?.isNotEmpty ?? false);
  }

  // Helper method to get all available days
  List<String> get availableDays {
    List<String> days = [];
    if (saturday?.isNotEmpty ?? false) days.add('Saturday');
    if (sunday?.isNotEmpty ?? false) days.add('Sunday');
    if (monday?.isNotEmpty ?? false) days.add('Monday');
    if (tuesday?.isNotEmpty ?? false) days.add('Tuesday');
    if (wednesday?.isNotEmpty ?? false) days.add('Wednesday');
    if (thursday?.isNotEmpty ?? false) days.add('Thursday');
    if (friday?.isNotEmpty ?? false) days.add('Friday');
    return days;
  }
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
