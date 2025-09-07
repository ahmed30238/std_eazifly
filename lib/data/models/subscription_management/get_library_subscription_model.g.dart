// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_library_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLibrarySubscriptionModel _$GetLibrarySubscriptionModelFromJson(
  Map<String, dynamic> json,
) => GetLibrarySubscriptionModel()
  ..data = json['data'] == null
      ? null
      : GetLibrarySubscriptionDataModel.fromJson(
          json['data'] as Map<String, dynamic>,
        )
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetLibrarySubscriptionModelToJson(
  GetLibrarySubscriptionModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

GetLibrarySubscriptionDataModel _$GetLibrarySubscriptionDataModelFromJson(
  Map<String, dynamic> json,
) => GetLibrarySubscriptionDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..plan = json['plan'] == null
      ? null
      : GetLibrarySubscriptionPlanModel.fromJson(
          json['plan'] as Map<String, dynamic>,
        )
  ..fromDate = json['from_date'] == null
      ? null
      : DateTime.parse(json['from_date'] as String)
  ..expireDate = json['expire_date'] == null
      ? null
      : DateTime.parse(json['expire_date'] as String);

Map<String, dynamic> _$GetLibrarySubscriptionDataModelToJson(
  GetLibrarySubscriptionDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'plan': instance.plan?.toJson(),
  'from_date': instance.fromDate?.toIso8601String(),
  'expire_date': instance.expireDate?.toIso8601String(),
};

GetLibrarySubscriptionPlanModel _$GetLibrarySubscriptionPlanModelFromJson(
  Map<String, dynamic> json,
) => GetLibrarySubscriptionPlanModel()
  ..id = (json['id'] as num?)?.toInt()
  ..price = (json['price'] as num?)?.toInt()
  ..days = (json['days'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..description = json['description'] as String?;

Map<String, dynamic> _$GetLibrarySubscriptionPlanModelToJson(
  GetLibrarySubscriptionPlanModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'price': instance.price,
  'days': instance.days,
  'title': instance.title,
  'description': instance.description,
};
