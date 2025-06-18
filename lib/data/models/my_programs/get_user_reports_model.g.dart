// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_reports_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserReportsModel _$GetUserReportsModelFromJson(Map<String, dynamic> json) =>
    GetUserReportsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => UserReportModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetUserReportsModelToJson(
        GetUserReportsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

UserReportModel _$UserReportModelFromJson(Map<String, dynamic> json) =>
    UserReportModel()
      ..id = (json['id'] as num?)?.toInt()
      ..reportMakerType = json['report_maker_type'] as String?
      ..reportMakerName = json['report_maker_name'] as String?
      ..reportMakerImage = json['report_maker_image'] as String?
      ..reportForType = json['report_for_type'] as String?
      ..reportForName = json['report_for_name'] as String?
      ..reportForImage = json['report_for_image'] as String?
      ..program = json['program'] as String?
      ..reportQuestion = json['report_question'] as String?
      ..reportQuestionAnswer = json['report_question_answer'] as String?
      ..note = json['note'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$UserReportModelToJson(UserReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'report_maker_type': instance.reportMakerType,
      'report_maker_name': instance.reportMakerName,
      'report_maker_image': instance.reportMakerImage,
      'report_for_type': instance.reportForType,
      'report_for_name': instance.reportForName,
      'report_for_image': instance.reportForImage,
      'program': instance.program,
      'report_question': instance.reportQuestion,
      'report_question_answer': instance.reportQuestionAnswer,
      'note': instance.note,
      'created_at': instance.createdAt?.toIso8601String(),
    };
