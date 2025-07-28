import 'package:eazifly_student/data/models/my_programs/get_user_feedbacks_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetUserFeedbacksEntity {
  @JsonKey(name: "data")
  List<UserFeedbackModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetUserFeedbacksEntity({
    this.data,
    this.status,
    this.message,
  });
}

class UserFeedbackEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "instructor")
  String? instructor;

  @JsonKey(name: "client")
  String? client;

  @JsonKey(name: "user")
  String? user;

  @JsonKey(name: "feedback")
  String? feedback;

  @JsonKey(name: "date")
  DateTime? date;

  @JsonKey(name: "is_read")
  bool? isRead;

  @JsonKey(name: "maker")
  String? maker;
  @JsonKey(name: "image")
  String? image;

  UserFeedbackEntity({
    this.id,
    this.instructor,
    this.client,
    this.user,
    this.feedback,
    this.date,
    this.isRead,
  });
}
