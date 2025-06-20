import 'package:eazifly_student/data/models/my_programs/quizzes/get_user_quizzes_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetUserQuizzesEntity {
  @JsonKey(name: "data")
  List<QuizDatumModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetUserQuizzesEntity({
    this.data,
    this.status,
    this.message,
  });
}

class QuizDatumEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "level")
  String? level;

  @JsonKey(name: "number_of_questions")
  String? numberOfQuestions;

  @JsonKey(name: "users_status")
  String? usersStatus;

  @JsonKey(name: "deadline")
  DateTime? deadline;

  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "program_id")
  String? programId;

  @JsonKey(name: "instructor_id")
  String? instructorId;

  @JsonKey(name: "tenant_id")
  String? tenantId;

  @JsonKey(name: "created_at")
  DateTime? createdAt;

  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  @JsonKey(name: "title")
  String? title;

  QuizDatumEntity({
    this.id,
    this.level,
    this.numberOfQuestions,
    this.usersStatus,
    this.deadline,
    this.status,
    this.programId,
    this.instructorId,
    this.tenantId,
    this.createdAt,
    this.updatedAt,
    this.title,
  });
}
