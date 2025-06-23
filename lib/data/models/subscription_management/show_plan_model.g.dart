// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowPlanModel _$ShowPlanModelFromJson(Map<String, dynamic> json) =>
    ShowPlanModel()
      ..data = json['data'] == null
          ? null
          : ShowPlanDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$ShowPlanModelToJson(ShowPlanModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

ShowPlanDataModel _$ShowPlanDataModelFromJson(Map<String, dynamic> json) =>
    ShowPlanDataModel()
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

Map<String, dynamic> _$ShowPlanDataModelToJson(ShowPlanDataModel instance) =>
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
