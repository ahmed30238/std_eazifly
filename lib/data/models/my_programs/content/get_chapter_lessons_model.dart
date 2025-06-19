import 'package:eazifly_student/domain/entities/my_programs/content/get_chapter_lessons_entity.dart';
import 'package:eazifly_student/domain/entities/my_programs/content/get_content_chapter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_chapter_lessons_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetChapterLessonsModel extends GetChapterLessonsEntity {
  GetChapterLessonsModel();

  factory GetChapterLessonsModel.fromJson(Map<String, dynamic> json) =>
      _$GetChapterLessonsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetChapterLessonsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetChapterLessonsLessonModel extends LessonEntity {
  GetChapterLessonsLessonModel();

  factory GetChapterLessonsLessonModel.fromJson(Map<String, dynamic> json) =>
      _$GetChapterLessonsLessonModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetChapterLessonsLessonModelToJson(this);
}
