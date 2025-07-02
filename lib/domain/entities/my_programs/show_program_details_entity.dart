import 'package:eazifly_student/data/models/my_programs/show_program_details_model.dart';
import 'package:json_annotation/json_annotation.dart';

class ShowProgramDetailsEntity {
  @JsonKey(name: "data")
  ShowProgramDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  ShowProgramDetailsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class ShowProgramDataEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "goals")
  String? goals;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "why_us")
  String? whyUs;
  @JsonKey(name: "limit_users")
  String? limitUsers;
  @JsonKey(name: "learning_track")
  String? learningTrack;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "program_type")
  String? programType;
  @JsonKey(name: "special_for")
  String? specialFor;
  @JsonKey(name: "advantages")
  dynamic advantages;
  @JsonKey(name: "plan_page")
  String? planPage;
  @JsonKey(name: "next_session")
  NextSessionModel? nextSession;
  @JsonKey(name: "host")
  String? host;
  @JsonKey(name: "goals_percentage")
  int? goalsPercentage;
  @JsonKey(name: "content_id")
  String? contentId;
  ShowProgramDataEntity({
    this.id,
    this.title,
    this.label,
    this.description,
    this.slug,
    this.goals,
    this.content,
    this.whyUs,
    this.limitUsers,
    this.learningTrack,
    this.image,
    this.programType,
    this.specialFor,
    this.advantages,
    this.planPage,
    this.nextSession,
    this.host,
    this.goalsPercentage,
    this.contentId,
  });
}

class NextSessionEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "instructor_id")
  String? instructorId;
  @JsonKey(name: "session_datetime")
  DateTime? sessionDatetime;
  @JsonKey(name: "duration")
  String? duration;
  @JsonKey(name: "meeting_url")
  String? meetingUrl;

  NextSessionEntity({
    this.id,
    this.instructorId,
    this.sessionDatetime,
    this.duration,
    this.meetingUrl,
  });
}
