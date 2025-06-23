// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_program_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProgramSubscriptionModel _$GetProgramSubscriptionModelFromJson(
        Map<String, dynamic> json) =>
    GetProgramSubscriptionModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => GetProgramSubscriptionDatumModel.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetProgramSubscriptionModelToJson(
        GetProgramSubscriptionModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetProgramSubscriptionDatumModel _$GetProgramSubscriptionDatumModelFromJson(
        Map<String, dynamic> json) =>
    GetProgramSubscriptionDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..mainSubscriptionId = (json['main_subscription_id'] as num?)?.toInt()
      ..programId = (json['program_id'] as num?)?.toInt()
      ..program = json['program'] as String?
      ..price = json['price'] as String?
      ..instructor = json['instructor'] == null
          ? null
          : GetProgramSubscriptionInstructorModel.fromJson(
              json['instructor'] as Map<String, dynamic>)
      ..daysToExpire = json['DaysToExpire']
      ..subscriptionDate = json['subscription_date'] == null
          ? null
          : DateTime.parse(json['subscription_date'] as String)
      ..expireDate = json['expire_date'] == null
          ? null
          : DateTime.parse(json['expire_date'] as String)
      ..studentNumber = json['student_number'] as String?
      ..missedSessions = (json['missed_sessions'] as num?)?.toInt()
      ..completedSessions = (json['completed_sessions'] as num?)?.toInt();

Map<String, dynamic> _$GetProgramSubscriptionDatumModelToJson(
        GetProgramSubscriptionDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'main_subscription_id': instance.mainSubscriptionId,
      'program_id': instance.programId,
      'program': instance.program,
      'price': instance.price,
      'instructor': instance.instructor?.toJson(),
      'DaysToExpire': instance.daysToExpire,
      'subscription_date': instance.subscriptionDate?.toIso8601String(),
      'expire_date': instance.expireDate?.toIso8601String(),
      'student_number': instance.studentNumber,
      'missed_sessions': instance.missedSessions,
      'completed_sessions': instance.completedSessions,
    };

GetProgramSubscriptionInstructorModel
    _$GetProgramSubscriptionInstructorModelFromJson(
            Map<String, dynamic> json) =>
        GetProgramSubscriptionInstructorModel()
          ..name = json['name'] as String?
          ..image = json['image'] as String?;

Map<String, dynamic> _$GetProgramSubscriptionInstructorModelToJson(
        GetProgramSubscriptionInstructorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
