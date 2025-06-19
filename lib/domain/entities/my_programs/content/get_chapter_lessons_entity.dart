import 'package:eazifly_student/data/models/my_programs/content/get_chapter_lessons_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetChapterLessonsEntity {
  @JsonKey(name: "data")
  List<GetChapterLessonsLessonModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetChapterLessonsEntity({
    this.data,
    this.status,
    this.message,
  });
}
