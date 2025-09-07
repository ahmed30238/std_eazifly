// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chapter_lessons_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetChapterLessonsModel _$GetChapterLessonsModelFromJson(
  Map<String, dynamic> json,
) => GetChapterLessonsModel()
  ..data = (json['data'] as List<dynamic>?)
      ?.map(
        (e) => GetChapterLessonsLessonModel.fromJson(e as Map<String, dynamic>),
      )
      .toList()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetChapterLessonsModelToJson(
  GetChapterLessonsModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

GetChapterLessonsLessonModel _$GetChapterLessonsLessonModelFromJson(
  Map<String, dynamic> json,
) => GetChapterLessonsLessonModel()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..isFinished = json['is_finished'] as String?
  ..points = json['points'] as String?
  ..isDone = json['is_done'] as bool?;

Map<String, dynamic> _$GetChapterLessonsLessonModelToJson(
  GetChapterLessonsLessonModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'is_finished': instance.isFinished,
  'points': instance.points,
  'is_done': instance.isDone,
};
