import 'package:eazifly_student/domain/entities/my_programs/content/complete_chapter_lesson_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complete_chapter_lesson_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CompleteChapterLessonModel extends CompleteChapterLessonEntity {
  CompleteChapterLessonModel();

  factory CompleteChapterLessonModel.fromJson(Map<String, dynamic> json) =>
      _$CompleteChapterLessonModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteChapterLessonModelToJson(this);
}
