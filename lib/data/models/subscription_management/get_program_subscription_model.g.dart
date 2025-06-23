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
      ..plan = json['plan'] == null
          ? null
          : GetProgramSubscriptionPlanModel.fromJson(
              json['plan'] as Map<String, dynamic>)
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
      'plan': instance.plan?.toJson(),
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
          ..id = json['id'] as String?
          ..name = json['name'] as String?
          ..image = json['image'] as String?;

Map<String, dynamic> _$GetProgramSubscriptionInstructorModelToJson(
        GetProgramSubscriptionInstructorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

GetProgramSubscriptionPlanModel _$GetProgramSubscriptionPlanModelFromJson(
        Map<String, dynamic> json) =>
    GetProgramSubscriptionPlanModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..program = json['program'] as String?
      ..label = json['label'] as String?
      ..description = json['description'] as String?
      ..currency = json['currency'] as String?
      ..price = json['price'] as String?
      ..discountPrice = json['discount_price'] as String?
      ..subscripeDays = json['subscripe_days'] as String?
      ..duration = json['duration'] as String?
      ..numberOfSessionPerWeek = json['number_of_session_per_week'] as String?
      ..isSpecialPlan = json['is_special_plan'] as bool?
      ..type = json['type'] as String?;

Map<String, dynamic> _$GetProgramSubscriptionPlanModelToJson(
        GetProgramSubscriptionPlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'program': instance.program,
      'label': instance.label,
      'description': instance.description,
      'currency': instance.currency,
      'price': instance.price,
      'discount_price': instance.discountPrice,
      'subscripe_days': instance.subscripeDays,
      'duration': instance.duration,
      'number_of_session_per_week': instance.numberOfSessionPerWeek,
      'is_special_plan': instance.isSpecialPlan,
      'type': instance.type,
    };
