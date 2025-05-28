// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_plans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterPlansModel _$FilterPlansModelFromJson(Map<String, dynamic> json) =>
    FilterPlansModel()
      ..data = json['data'] == null
          ? null
          : FilterPlansDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$FilterPlansModelToJson(FilterPlansModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

FilterPlansDataModel _$FilterPlansDataModelFromJson(
        Map<String, dynamic> json) =>
    FilterPlansDataModel()
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
      ..numberOfSessionPerWeek = json['number_of_session_per_week'] as String?;

Map<String, dynamic> _$FilterPlansDataModelToJson(
        FilterPlansDataModel instance) =>
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
