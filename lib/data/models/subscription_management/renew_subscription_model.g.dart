// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renew_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenewSubscriptionModel _$RenewSubscriptionModelFromJson(
  Map<String, dynamic> json,
) => RenewSubscriptionModel()
  ..data = json['data'] == null
      ? null
      : RenewSubscriptionDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        )
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$RenewSubscriptionModelToJson(
  RenewSubscriptionModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

RenewSubscriptionDataModel _$RenewSubscriptionDataModelFromJson(
  Map<String, dynamic> json,
) => RenewSubscriptionDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..user = json['user'] == null
      ? null
      : RenewSubscriptionUserModel.fromJson(
          json['user'] as Map<String, dynamic>,
        )
  ..totalOrderPrice = (json['total_order_price'] as num?)?.toInt()
  ..totalAfterDiscount = (json['total_after_discount'] as num?)?.toInt()
  ..currency = json['currency'] as String?
  ..status = json['status'] == null
      ? null
      : RenewSubscriptionStatusModel.fromJson(
          json['status'] as Map<String, dynamic>,
        )
  ..type = json['type'] == null
      ? null
      : RenewSubscriptionStatusModel.fromJson(
          json['type'] as Map<String, dynamic>,
        )
  ..subscriptionType = json['subscription_type'] as String?
  ..usedCoupon = json['used_coupon'] as bool?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..orderDetails = (json['order_details'] as List<dynamic>?)
      ?.map(
        (e) => RenewSubscriptionOrderDetailModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList();

Map<String, dynamic> _$RenewSubscriptionDataModelToJson(
  RenewSubscriptionDataModel instance,
) => <String, dynamic>{
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

RenewSubscriptionOrderDetailModel _$RenewSubscriptionOrderDetailModelFromJson(
  Map<String, dynamic> json,
) => RenewSubscriptionOrderDetailModel()
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

Map<String, dynamic> _$RenewSubscriptionOrderDetailModelToJson(
  RenewSubscriptionOrderDetailModel instance,
) => <String, dynamic>{
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

RenewSubscriptionStatusModel _$RenewSubscriptionStatusModelFromJson(
  Map<String, dynamic> json,
) => RenewSubscriptionStatusModel()
  ..label = json['label'] as String?
  ..color = json['color'] as String?;

Map<String, dynamic> _$RenewSubscriptionStatusModelToJson(
  RenewSubscriptionStatusModel instance,
) => <String, dynamic>{'label': instance.label, 'color': instance.color};

RenewSubscriptionUserModel _$RenewSubscriptionUserModelFromJson(
  Map<String, dynamic> json,
) => RenewSubscriptionUserModel()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..image = json['image'] as String?;

Map<String, dynamic> _$RenewSubscriptionUserModelToJson(
  RenewSubscriptionUserModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
