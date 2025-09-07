// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel()
  ..data = json['data'] == null
      ? null
      : DataModel.fromJson(json['data'] as Map<String, dynamic>)
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..firstName = json['first_name'] as String?
  ..lastName = json['last_name'] as String?
  ..userName = json['user_name'] as String?
  ..email = json['email'] as String?
  ..parentId = json['parent_id'] as String?
  ..phone = json['phone'] as String?
  ..whatsApp = json['whats_app'] as String?
  ..image = json['image'] as String?
  ..gender = json['gender'] as String?
  ..parentName = json['parent_name'] as String?
  ..userCoupon = json['user_coupon'] as String?
  ..bonus = json['bonus'] as String?
  ..childrens = (json['childrens'] as List<dynamic>?)
      ?.map((e) => DataModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..age = DataEntity.customInt(json['age'])
  ..token = json['token'] as String?
  ..isGuest = json['is_guest'] as bool?
  ..fcmToken = json['fcm_token']
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..lastActiveAt = json['last_active_at'] == null
      ? null
      : DateTime.parse(json['last_active_at'] as String)
  ..renewData = json['renew_data'] == null
      ? null
      : DateTime.parse(json['renew_data'] as String)
  ..statusLabel = json['status_label'] == null
      ? null
      : StatusLabelModel.fromJson(json['status_label'] as Map<String, dynamic>)
  ..programs = (json['programs'] as List<dynamic>?)
      ?.map((e) => ProgramModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..chatId = json['chat_id'];

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'user_name': instance.userName,
  'email': instance.email,
  'parent_id': instance.parentId,
  'phone': instance.phone,
  'whats_app': instance.whatsApp,
  'image': instance.image,
  'gender': instance.gender,
  'parent_name': instance.parentName,
  'user_coupon': instance.userCoupon,
  'bonus': instance.bonus,
  'childrens': instance.childrens?.map((e) => e.toJson()).toList(),
  'age': instance.age,
  'token': instance.token,
  'is_guest': instance.isGuest,
  'fcm_token': instance.fcmToken,
  'created_at': instance.createdAt?.toIso8601String(),
  'last_active_at': instance.lastActiveAt?.toIso8601String(),
  'renew_data': instance.renewData?.toIso8601String(),
  'status_label': instance.statusLabel?.toJson(),
  'programs': instance.programs?.map((e) => e.toJson()).toList(),
  'chat_id': instance.chatId,
};

ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) => ProgramModel()
  ..title = json['title'] as String?
  ..image = json['image'] as String?;

Map<String, dynamic> _$ProgramModelToJson(ProgramModel instance) =>
    <String, dynamic>{'title': instance.title, 'image': instance.image};

StatusLabelModel _$StatusLabelModelFromJson(Map<String, dynamic> json) =>
    StatusLabelModel()
      ..label = json['label'] as String?
      ..color = json['color'] as String?;

Map<String, dynamic> _$StatusLabelModelToJson(StatusLabelModel instance) =>
    <String, dynamic>{'label': instance.label, 'color': instance.color};
