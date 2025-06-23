// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelSubscriptionModel _$CancelSubscriptionModelFromJson(
        Map<String, dynamic> json) =>
    CancelSubscriptionModel()
      ..data = json['data']
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$CancelSubscriptionModelToJson(
        CancelSubscriptionModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
