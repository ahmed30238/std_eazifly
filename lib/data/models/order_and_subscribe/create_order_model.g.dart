// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderModel _$CreateOrderModelFromJson(Map<String, dynamic> json) =>
    CreateOrderModel()
      ..data = json['data'] == null
          ? null
          : CreateOrderDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$CreateOrderModelToJson(CreateOrderModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

CreateOrderDataModel _$CreateOrderDataModelFromJson(
        Map<String, dynamic> json) =>
    CreateOrderDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..user = json['user'] == null
          ? null
          : CreateOrderUser.fromJson(json['user'] as Map<String, dynamic>)
      ..totalOrderPrice = (json['total_order_price'] as num?)?.toInt()
      ..totalAfterDiscount = (json['total_after_discount'] as num?)?.toInt()
      ..currency = json['currency'] as String?
      ..status = json['status'] == null
          ? null
          : CreateOrderStatus.fromJson(json['status'] as Map<String, dynamic>)
      ..type = json['type'] == null
          ? null
          : CreateOrderStatus.fromJson(json['type'] as Map<String, dynamic>)
      ..subscriptionType = json['subscription_type'] as String?
      ..usedCoupon = json['used_coupon'] as bool?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..orderDetails = (json['order_details'] as List<dynamic>?)
          ?.map(
              (e) => CreateOrderOrderDetail.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CreateOrderDataModelToJson(
        CreateOrderDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'total_order_price': instance.totalOrderPrice,
      'total_after_discount': instance.totalAfterDiscount,
      'currency': instance.currency,
      'status': instance.status?.toJson(),
      'type': instance.type?.toJson(),
      'subscription_type': instance.subscriptionType,
      'used_coupon': instance.usedCoupon,
      'created_at': instance.createdAt?.toIso8601String(),
      'order_details': instance.orderDetails?.map((e) => e.toJson()).toList(),
    };

CreateOrderOrderDetail _$CreateOrderOrderDetailFromJson(
        Map<String, dynamic> json) =>
    CreateOrderOrderDetail()
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

Map<String, dynamic> _$CreateOrderOrderDetailToJson(
        CreateOrderOrderDetail instance) =>
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

CreateOrderStatus _$CreateOrderStatusFromJson(Map<String, dynamic> json) =>
    CreateOrderStatus()
      ..label = json['label'] as String?
      ..color = json['color'] as String?;

Map<String, dynamic> _$CreateOrderStatusToJson(CreateOrderStatus instance) =>
    <String, dynamic>{
      'label': instance.label,
      'color': instance.color,
    };

CreateOrderUser _$CreateOrderUserFromJson(Map<String, dynamic> json) =>
    CreateOrderUser()
      ..id = (json['id'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$CreateOrderUserToJson(CreateOrderUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
