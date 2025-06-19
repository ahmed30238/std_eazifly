import 'package:eazifly_student/data/models/my_programs/content/get_content_chapter_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetContentChapterEntity {
  @JsonKey(name: "data")
  List<ChapterModel>? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetContentChapterEntity({
    this.data,
    this.status,
    this.message,
  });
}

class ChapterEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "file")
  String? file;

  @JsonKey(name: "file_type")
  String? fileType;

  @JsonKey(name: "lessons")
  List<LessonModel>? lessons;

  ChapterEntity({
    this.id,
    this.title,
    this.description,
    this.file,
    this.fileType,
    this.lessons,
  });
}

class LessonEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "is_finished")
  String? isFinished;

  @JsonKey(name: "points")
  String? points;

  @JsonKey(name: "is_done")
  bool? isDone;

  LessonEntity({
    this.id,
    this.title,
    this.description,
    this.isFinished,
    this.points,
    this.isDone,
  });
}
