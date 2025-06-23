// get_program_subscription_entity.dart

import 'package:eazifly_student/data/models/subscription_management/get_program_subscription_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetProgramSubscriptionEntity {
  @JsonKey(name: "data")
  List<GetProgramSubscriptionDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetProgramSubscriptionEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetProgramSubscriptionDatumEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "main_subscription_id")
  int? mainSubscriptionId;

  @JsonKey(name: "program_id")
  int? programId;

  @JsonKey(name: "program")
  String? program;

  @JsonKey(name: "price")
  String? price;

  @JsonKey(name: "instructor")
  GetProgramSubscriptionInstructorModel? instructor;

  @JsonKey(name: "DaysToExpire")
  dynamic daysToExpire;

  @JsonKey(name: "subscription_date")
  DateTime? subscriptionDate;

  @JsonKey(name: "expire_date")
  DateTime? expireDate;

  @JsonKey(name: "student_number")
  String? studentNumber;

  @JsonKey(name: "missed_sessions")
  int? missedSessions;

  @JsonKey(name: "completed_sessions")
  int? completedSessions;

  GetProgramSubscriptionDatumEntity({
    this.id,
    this.mainSubscriptionId,
    this.programId,
    this.program,
    this.price,
    this.instructor,
    this.daysToExpire,
    this.subscriptionDate,
    this.expireDate,
    this.studentNumber,
    this.missedSessions,
    this.completedSessions,
  });
}

class GetProgramSubscriptionInstructorEntity {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "image")
  String? image;

  GetProgramSubscriptionInstructorEntity({
    this.name,
    this.image,
  });
}
