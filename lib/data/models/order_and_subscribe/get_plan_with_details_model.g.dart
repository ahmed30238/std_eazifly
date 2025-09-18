// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plan_with_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlansWithDetailsModel _$GetPlansWithDetailsModelFromJson(
  Map<String, dynamic> json,
) => GetPlansWithDetailsModel()
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => PlanDetailsModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetPlansWithDetailsModelToJson(
  GetPlansWithDetailsModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

PlanDetailsModel _$PlanDetailsModelFromJson(Map<String, dynamic> json) =>
    PlanDetailsModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..program = json['program'] as String?
      ..label = json['label'] as String?
      ..description = json['description'] as String?
      ..currency = json['currency'] as String?
      ..price = json['price'] as String?
      ..discountPrice = json['discount_price'] as String?
      ..subscripeDays = PlanDetailsEntity.customInt(json['subscripe_days'])
      ..duration = json['duration'] as String?
      ..numberOfSessionPerWeek = json['number_of_session_per_week'] as String?
      ..isSpecialPlan = json['is_special_plan'] as bool?
      ..type = json['type'] as String?
      ..planTitle = json['plan_title'] as String?
      ..subscriptionPlan = json['subscription_plan'] as String?
      ..titleAr = json['title_ar'] as String?
      ..descriptionAr = json['description_ar'] as String?
      ..labelAr = json['label_ar'] as String?
      ..titleEn = json['title_en'] as String?
      ..descriptionEn = json['description_en'] as String?
      ..labelEn = json['label_en'] as String?;

Map<String, dynamic> _$PlanDetailsModelToJson(PlanDetailsModel instance) =>
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
      'plan_title': instance.planTitle,
      'subscription_plan': instance.subscriptionPlan,
      'title_ar': instance.titleAr,
      'description_ar': instance.descriptionAr,
      'label_ar': instance.labelAr,
      'title_en': instance.titleEn,
      'description_en': instance.descriptionEn,
      'label_en': instance.labelEn,
    };
