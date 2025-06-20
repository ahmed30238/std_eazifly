// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_quizzes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserQuizzesModel _$GetUserQuizzesModelFromJson(Map<String, dynamic> json) =>
    GetUserQuizzesModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => QuizDatumModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetUserQuizzesModelToJson(
        GetUserQuizzesModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

QuizDatumModel _$QuizDatumModelFromJson(Map<String, dynamic> json) =>
    QuizDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..level = json['level'] as String?
      ..numberOfQuestions = json['number_of_questions'] as String?
      ..usersStatus = json['users_status'] as String?
      ..deadline = json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String)
      ..status = json['status'] as String?
      ..programId = json['program_id'] as String?
      ..instructorId = json['instructor_id'] as String?
      ..tenantId = json['tenant_id'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..updatedAt = json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String)
      ..title = json['title'] as String?;

Map<String, dynamic> _$QuizDatumModelToJson(QuizDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'level': instance.level,
      'number_of_questions': instance.numberOfQuestions,
      'users_status': instance.usersStatus,
      'deadline': instance.deadline?.toIso8601String(),
      'status': instance.status,
      'program_id': instance.programId,
      'instructor_id': instance.instructorId,
      'tenant_id': instance.tenantId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'title': instance.title,
    };
