// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_copoun_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckCopounModel _$CheckCopounModelFromJson(Map<String, dynamic> json) =>
    CheckCopounModel()
      ..data = json['data'] == null
          ? null
          : CheckCopounDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$CheckCopounModelToJson(CheckCopounModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

CheckCopounDataModel _$CheckCopounDataModelFromJson(
        Map<String, dynamic> json) =>
    CheckCopounDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..code = json['code'] as String?
      ..discount = (json['discount'] as num?)?.toInt()
      ..discountType = json['discount_type'] as String?
      ..expireDate = json['expire_date'] == null
          ? null
          : DateTime.parse(json['expire_date'] as String)
      ..timesUsed = (json['times_used'] as num?)?.toInt()
      ..alreadyUsed = (json['already_used'] as num?)?.toInt();

Map<String, dynamic> _$CheckCopounDataModelToJson(
        CheckCopounDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'discount': instance.discount,
      'discount_type': instance.discountType,
      'expire_date': instance.expireDate?.toIso8601String(),
      'times_used': instance.timesUsed,
      'already_used': instance.alreadyUsed,
    };
