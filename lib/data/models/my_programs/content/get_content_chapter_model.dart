import 'package:eazifly_student/domain/entities/my_programs/content/get_content_chapter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_content_chapter_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetContentChapterModel extends GetContentChapterEntity {
  GetContentChapterModel();

  factory GetContentChapterModel.fromJson(Map<String, dynamic> json) =>
      _$GetContentChapterModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetContentChapterModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChapterModel extends ChapterEntity {
  ChapterModel();

  factory ChapterModel.fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LessonModel extends LessonEntity {
  LessonModel();

  factory LessonModel.fromJson(Map<String, dynamic> json) =>
      _$LessonModelFromJson(json);

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);
}
