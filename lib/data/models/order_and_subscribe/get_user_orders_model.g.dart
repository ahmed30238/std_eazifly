// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserOrdersModel _$GetUserOrdersModelFromJson(Map<String, dynamic> json) =>
    GetUserOrdersModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CreateOrderDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetUserOrdersModelToJson(GetUserOrdersModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

UserOrderModel _$UserOrderModelFromJson(Map<String, dynamic> json) =>
    UserOrderModel()
      ..id = (json['id'] as num?)?.toInt()
      ..user = json['user'] == null
          ? null
          : CreateOrderUser.fromJson(json['user'] as Map<String, dynamic>)
      ..totalOrderPrice =
          CreateOrderDataEntity.customInt(json['total_order_price'])
      ..totalAfterDiscount =
          CreateOrderDataEntity.customInt(json['total_after_discount'])
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

Map<String, dynamic> _$UserOrderModelToJson(UserOrderModel instance) =>
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

OrderDetailModel _$OrderDetailModelFromJson(Map<String, dynamic> json) =>
    OrderDetailModel()
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

Map<String, dynamic> _$OrderDetailModelToJson(OrderDetailModel instance) =>
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

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel()
  ..label = json['label'] as String?
  ..color = json['color'] as String?;

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'color': instance.color,
    };

OrderUserModel _$OrderUserModelFromJson(Map<String, dynamic> json) =>
    OrderUserModel()
      ..id = CreateOrderUserEntity.customInt(json['id'])
      ..name = json['name'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$OrderUserModelToJson(OrderUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
