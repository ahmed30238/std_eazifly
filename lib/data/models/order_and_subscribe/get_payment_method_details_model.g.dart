// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_method_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentMethodDetailsModel _$GetPaymentMethodDetailsModelFromJson(
  Map<String, dynamic> json,
) => GetPaymentMethodDetailsModel()
  ..data = json['data'] == null
      ? null
      : ProgramPaymentMethodModel.fromJson(json['data'] as Map<String, dynamic>)
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetPaymentMethodDetailsModelToJson(
  GetPaymentMethodDetailsModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

PaymentMethodDetailsModel _$PaymentMethodDetailsModelFromJson(
  Map<String, dynamic> json,
) => PaymentMethodDetailsModel()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..image = json['image'] as String?
  ..howToUse = json['how_to_use']
  ..payOn = json['pay_on'] as String?
  ..programId = json['program_id'] as String?;

Map<String, dynamic> _$PaymentMethodDetailsModelToJson(
  PaymentMethodDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'how_to_use': instance.howToUse,
  'pay_on': instance.payOn,
  'program_id': instance.programId,
};
