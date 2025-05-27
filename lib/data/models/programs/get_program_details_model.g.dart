// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_program_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProgramDetailsModel _$GetProgramDetailsModelFromJson(
        Map<String, dynamic> json) =>
    GetProgramDetailsModel()
      ..data = json['data'] == null
          ? null
          : ProgramDetailsDataModel.fromJson(
              json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetProgramDetailsModelToJson(
        GetProgramDetailsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

ProgramDetailsDataModel _$ProgramDetailsDataModelFromJson(
        Map<String, dynamic> json) =>
    ProgramDetailsDataModel()
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
      ..category = json['category'] as String?
      ..image = json['image'] as String?
      ..programType = json['program_type'] as String?
      ..specialFor = json['special_for'] as String?
      ..advantages = json['advantages']
      ..instructors = (json['instructors'] as List<dynamic>?)
          ?.map((e) => InstructorModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..reviews = (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProgramDetailsDataModelToJson(
        ProgramDetailsDataModel instance) =>
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
      'category': instance.category,
      'image': instance.image,
      'program_type': instance.programType,
      'special_for': instance.specialFor,
      'advantages': instance.advantages,
      'instructors': instance.instructors?.map((e) => e.toJson()).toList(),
      'reviews': instance.reviews?.map((e) => e.toJson()).toList(),
    };
