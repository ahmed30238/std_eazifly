// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitQuizModel _$SubmitQuizModelFromJson(Map<String, dynamic> json) =>
    SubmitQuizModel()
      ..data = json['data']
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$SubmitQuizModelToJson(SubmitQuizModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
