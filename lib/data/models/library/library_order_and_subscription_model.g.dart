// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_order_and_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryOrderAndSubscriptionModel _$LibraryOrderAndSubscriptionModelFromJson(
  Map<String, dynamic> json,
) => LibraryOrderAndSubscriptionModel()
  ..data = json['data'] == null
      ? null
      : LibraryOrderDataModel.fromJson(json['data'] as Map<String, dynamic>)
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$LibraryOrderAndSubscriptionModelToJson(
  LibraryOrderAndSubscriptionModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

LibraryOrderDataModel _$LibraryOrderDataModelFromJson(
  Map<String, dynamic> json,
) => LibraryOrderDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..price = json['price'] as String?
  ..image = json['image'] as String?
  ..status = json['status'] as String?
  ..orderType = json['order_type'] as String?;

Map<String, dynamic> _$LibraryOrderDataModelToJson(
  LibraryOrderDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'price': instance.price,
  'image': instance.image,
  'status': instance.status,
  'order_type': instance.orderType,
};
