// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeOrderModel _$UpgradeOrderModelFromJson(Map<String, dynamic> json) =>
    UpgradeOrderModel()
      ..data = json['data'] == null
          ? null
          : UpgradeOrderDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$UpgradeOrderModelToJson(UpgradeOrderModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

UpgradeOrderDataModel _$UpgradeOrderDataModelFromJson(
        Map<String, dynamic> json) =>
    UpgradeOrderDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..user = json['user'] == null
          ? null
          : UpgradeOrderUserModel.fromJson(json['user'] as Map<String, dynamic>)
      ..totalOrderPrice = (json['total_order_price'] as num?)?.toInt()
      ..totalAfterDiscount = (json['total_after_discount'] as num?)?.toInt()
      ..currency = json['currency'] as String?
      ..status = json['status'] == null
          ? null
          : UpgradeOrderStatusModel.fromJson(
              json['status'] as Map<String, dynamic>)
      ..type = json['type'] == null
          ? null
          : UpgradeOrderStatusModel.fromJson(
              json['type'] as Map<String, dynamic>)
      ..subscriptionType = json['subscription_type'] as String?
      ..usedCoupon = json['used_coupon'] as bool?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..orderDetails = (json['order_details'] as List<dynamic>?)
          ?.map((e) =>
              UpgradeOrderDetailModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UpgradeOrderDataModelToJson(
        UpgradeOrderDataModel instance) =>
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

UpgradeOrderDetailModel _$UpgradeOrderDetailModelFromJson(
        Map<String, dynamic> json) =>
    UpgradeOrderDetailModel()
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
      ..numberOfSessionPerWeek = json['number_of_session_per_week'] as String?
      ..isSpecialPlan = json['is_special_plan'] as bool?
      ..type = json['type'] as String?;

Map<String, dynamic> _$UpgradeOrderDetailModelToJson(
        UpgradeOrderDetailModel instance) =>
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
    };

UpgradeOrderStatusModel _$UpgradeOrderStatusModelFromJson(
        Map<String, dynamic> json) =>
    UpgradeOrderStatusModel()
      ..label = json['label'] as String?
      ..color = json['color'] as String?;

Map<String, dynamic> _$UpgradeOrderStatusModelToJson(
        UpgradeOrderStatusModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'color': instance.color,
    };

UpgradeOrderUserModel _$UpgradeOrderUserModelFromJson(
        Map<String, dynamic> json) =>
    UpgradeOrderUserModel()
      ..id = (json['id'] as num?)?.toInt()
      ..name = json['name'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$UpgradeOrderUserModelToJson(
        UpgradeOrderUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
