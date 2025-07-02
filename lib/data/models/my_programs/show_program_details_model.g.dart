// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_program_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowProgramDetailsModel _$ShowProgramDetailsModelFromJson(
        Map<String, dynamic> json) =>
    ShowProgramDetailsModel()
      ..data = json['data'] == null
          ? null
          : ShowProgramDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$ShowProgramDetailsModelToJson(
        ShowProgramDetailsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

ShowProgramDataModel _$ShowProgramDataModelFromJson(
        Map<String, dynamic> json) =>
    ShowProgramDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..label = json['label'] as String?
      ..description = json['description'] as String?
      ..slug = json['slug'] as String?
      ..goals = json['goals'] as String?
      ..content = json['content'] as String?
      ..whyUs = json['why_us'] as String?
      ..limitUsers = json['limit_users'] as String?
      ..learningTrack = json['learning_track'] as String?
      ..image = json['image'] as String?
      ..programType = json['program_type'] as String?
      ..specialFor = json['special_for'] as String?
      ..advantages = json['advantages']
      ..planPage = json['plan_page'] as String?
      ..nextSession = json['next_session'] == null
          ? null
          : NextSessionModel.fromJson(
              json['next_session'] as Map<String, dynamic>)
      ..host = json['host'] as String?
      ..goalsPercentage = (json['goals_percentage'] as num?)?.toInt()
      ..contentId = json['content_id'] as String?;

Map<String, dynamic> _$ShowProgramDataModelToJson(
        ShowProgramDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'label': instance.label,
      'description': instance.description,
      'slug': instance.slug,
      'goals': instance.goals,
      'content': instance.content,
      'why_us': instance.whyUs,
      'limit_users': instance.limitUsers,
      'learning_track': instance.learningTrack,
      'image': instance.image,
      'program_type': instance.programType,
      'special_for': instance.specialFor,
      'advantages': instance.advantages,
      'plan_page': instance.planPage,
      'next_session': instance.nextSession?.toJson(),
      'host': instance.host,
      'goals_percentage': instance.goalsPercentage,
      'content_id': instance.contentId,
    };

NextSessionModel _$NextSessionModelFromJson(Map<String, dynamic> json) =>
    NextSessionModel()
      ..id = (json['id'] as num?)?.toInt()
      ..instructorId = json['instructor_id'] as String?
      ..sessionDatetime = json['session_datetime'] == null
          ? null
          : DateTime.parse(json['session_datetime'] as String)
      ..duration = json['duration'] as String?
      ..meetingUrl = json['meeting_url'] as String?;

Map<String, dynamic> _$NextSessionModelToJson(NextSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instructor_id': instance.instructorId,
      'session_datetime': instance.sessionDatetime?.toIso8601String(),
      'duration': instance.duration,
      'meeting_url': instance.meetingUrl,
    };
