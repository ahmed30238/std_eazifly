// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_content_chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetContentChapterModel _$GetContentChapterModelFromJson(
        Map<String, dynamic> json) =>
    GetContentChapterModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => ChapterModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetContentChapterModelToJson(
        GetContentChapterModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) => ChapterModel()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..file = json['file'] as String?
  ..fileType = json['file_type'] as String?
  ..lessons = (json['lessons'] as List<dynamic>?)
      ?.map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ChapterModelToJson(ChapterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'file': instance.file,
      'file_type': instance.fileType,
      'lessons': instance.lessons?.map((e) => e.toJson()).toList(),
    };

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) => LessonModel()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..isFinished = json['is_finished'] as String?
  ..points = json['points'] as String?
  ..isDone = json['is_done'] as bool?;

Map<String, dynamic> _$LessonModelToJson(LessonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'is_finished': instance.isFinished,
      'points': instance.points,
      'is_done': instance.isDone,
    };
