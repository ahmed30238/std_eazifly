// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNoteModel _$AddNoteModelFromJson(Map<String, dynamic> json) => AddNoteModel()
  ..data = json['data'] == null
      ? null
      : AddNoteDataModel.fromJson(json['data'] as Map<String, dynamic>)
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$AddNoteModelToJson(AddNoteModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

AddNoteDataModel _$AddNoteDataModelFromJson(
  Map<String, dynamic> json,
) => AddNoteDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..user = json['user'] == null
      ? null
      : AddNoteUserModel.fromJson(json['user'] as Map<String, dynamic>)
  ..totalOrderPrice = json['total_order_price'] as String?
  ..totalAfterDiscount = json['total_after_discount'] as String?
  ..currency = json['currency'] as String?
  ..status = json['status'] == null
      ? null
      : AddNoteStatusModel.fromJson(json['status'] as Map<String, dynamic>)
  ..type = json['type'] == null
      ? null
      : AddNoteStatusModel.fromJson(json['type'] as Map<String, dynamic>)
  ..subscriptionType = json['subscription_type'] as String?
  ..usedCoupon = json['used_coupon'] as bool?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..paymentMethod = json['payment_method'] as String?
  ..image = json['image'] as String?
  ..orderDetails = (json['order_details'] as List<dynamic>?)
      ?.map((e) => AddNoteOrderDetailModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..orderNotes = (json['order_notes'] as List<dynamic>?)
      ?.map((e) => AddNoteOrderNoteModel.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$AddNoteDataModelToJson(AddNoteDataModel instance) =>
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
      'payment_method': instance.paymentMethod,
      'image': instance.image,
      'order_details': instance.orderDetails?.map((e) => e.toJson()).toList(),
      'order_notes': instance.orderNotes?.map((e) => e.toJson()).toList(),
    };

AddNoteOrderDetailModel _$AddNoteOrderDetailModelFromJson(
  Map<String, dynamic> json,
) => AddNoteOrderDetailModel()
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
  ..type = json['type'] as String?
  ..planTitle = json['plan_title'] as String?;

Map<String, dynamic> _$AddNoteOrderDetailModelToJson(
  AddNoteOrderDetailModel instance,
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
  'plan_title': instance.planTitle,
};

AddNoteOrderNoteModel _$AddNoteOrderNoteModelFromJson(
  Map<String, dynamic> json,
) => AddNoteOrderNoteModel()
  ..id = (json['id'] as num?)?.toInt()
  ..type = json['type'] as String?
  ..maker = json['maker'] == null
      ? null
      : AddNoteMakerModel.fromJson(json['maker'] as Map<String, dynamic>)
  ..title = json['title'] as String?
  ..description = json['description'] as String?
  ..image = json['image'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$AddNoteOrderNoteModelToJson(
  AddNoteOrderNoteModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': instance.type,
  'maker': instance.maker?.toJson(),
  'title': instance.title,
  'description': instance.description,
  'image': instance.image,
  'created_at': instance.createdAt?.toIso8601String(),
};

AddNoteMakerModel _$AddNoteMakerModelFromJson(Map<String, dynamic> json) =>
    AddNoteMakerModel()
      ..name = json['name'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$AddNoteMakerModelToJson(AddNoteMakerModel instance) =>
    <String, dynamic>{'name': instance.name, 'image': instance.image};

AddNoteStatusModel _$AddNoteStatusModelFromJson(Map<String, dynamic> json) =>
    AddNoteStatusModel()
      ..label = json['label'] as String?
      ..color = json['color'] as String?;

Map<String, dynamic> _$AddNoteStatusModelToJson(AddNoteStatusModel instance) =>
    <String, dynamic>{'label': instance.label, 'color': instance.color};

AddNoteUserModel _$AddNoteUserModelFromJson(Map<String, dynamic> json) =>
    AddNoteUserModel()
      ..id = json['id'] as String?
      ..name = json['name'] as String?
      ..email = json['email'] as String?
      ..phone = json['phone'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$AddNoteUserModelToJson(AddNoteUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
    };
