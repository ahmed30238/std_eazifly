// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_plan_with_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPlansWithDetailsModel _$GetPlansWithDetailsModelFromJson(
        Map<String, dynamic> json) =>
    GetPlansWithDetailsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => PlanDetailsModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetPlansWithDetailsModelToJson(
        GetPlansWithDetailsModel instance) =>
    <String, dynamic>{
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
      ..subscripeDays = json['subscripe_days']
      ..duration = json['duration'] as String?
      ..numberOfSessionPerWeek = json['number_of_session_per_week'] as String?;

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
    };
