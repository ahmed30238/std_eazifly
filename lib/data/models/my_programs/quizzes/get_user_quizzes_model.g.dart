// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_quizzes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserQuizzesModel _$GetUserQuizzesModelFromJson(Map<String, dynamic> json) =>
    GetUserQuizzesModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map(
            (e) => GetUserQuizzesDatumModel.fromJson(e as Map<String, dynamic>),
          )
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetUserQuizzesModelToJson(
  GetUserQuizzesModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

GetUserQuizzesDatumModel _$GetUserQuizzesDatumModelFromJson(
  Map<String, dynamic> json,
) => GetUserQuizzesDatumModel()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..status = json['status'] as String?
  ..fullMark = json['full_mark'] as String?
  ..totalMark = json['total_mark'] as String?;

Map<String, dynamic> _$GetUserQuizzesDatumModelToJson(
  GetUserQuizzesDatumModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'created_at': instance.createdAt?.toIso8601String(),
  'status': instance.status,
  'full_mark': instance.fullMark,
  'total_mark': instance.totalMark,
};
