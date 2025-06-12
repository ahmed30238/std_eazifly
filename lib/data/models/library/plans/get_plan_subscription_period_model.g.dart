// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plan_subscription_period_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlanSubscriptionPeriodModel _$GetPlanSubscriptionPeriodModelFromJson(
        Map<String, dynamic> json) =>
    GetPlanSubscriptionPeriodModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              PlanSubscriptionPeriodModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetPlanSubscriptionPeriodModelToJson(
        GetPlanSubscriptionPeriodModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

PlanSubscriptionPeriodModel _$PlanSubscriptionPeriodModelFromJson(
        Map<String, dynamic> json) =>
    PlanSubscriptionPeriodModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..days = json['days'] as String?;

Map<String, dynamic> _$PlanSubscriptionPeriodModelToJson(
        PlanSubscriptionPeriodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'days': instance.days,
    };
