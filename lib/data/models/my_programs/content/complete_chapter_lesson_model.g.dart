// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_chapter_lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteChapterLessonModel _$CompleteChapterLessonModelFromJson(
  Map<String, dynamic> json,
) => CompleteChapterLessonModel()
  ..data = json['data']
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$CompleteChapterLessonModelToJson(
  CompleteChapterLessonModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'status': instance.status,
  'message': instance.message,
};
