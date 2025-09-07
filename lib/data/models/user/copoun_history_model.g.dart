// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copoun_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopounHistoryModel _$CopounHistoryModelFromJson(Map<String, dynamic> json) =>
    CopounHistoryModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map(
            (e) => CopounHistoryDatumModel.fromJson(e as Map<String, dynamic>),
          )
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$CopounHistoryModelToJson(CopounHistoryModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

CopounHistoryDatumModel _$CopounHistoryDatumModelFromJson(
  Map<String, dynamic> json,
) => CopounHistoryDatumModel()
  ..id = (json['id'] as num?)?.toInt()
  ..userId = (json['user_id'] as num?)?.toInt()
  ..orderId = (json['order_id'] as num?)?.toInt()
  ..couponId = (json['coupon_id'] as num?)?.toInt()
  ..bonus = (json['bonus'] as num?)?.toInt()
  ..type = json['type'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..updatedAt = json['updated_at'];

Map<String, dynamic> _$CopounHistoryDatumModelToJson(
  CopounHistoryDatumModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'order_id': instance.orderId,
  'coupon_id': instance.couponId,
  'bonus': instance.bonus,
  'type': instance.type,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt,
};
