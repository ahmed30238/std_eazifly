// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNewChildModel _$CreateNewChildModelFromJson(Map<String, dynamic> json) =>
    CreateNewChildModel()
      ..data = json['data'] == null
          ? null
          : NewChildModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$CreateNewChildModelToJson(
  CreateNewChildModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

NewChildModel _$NewChildModelFromJson(Map<String, dynamic> json) =>
    NewChildModel()
      ..id = (json['id'] as num?)?.toInt()
      ..firstName = json['first_name'] as String?
      ..lastName = json['last_name'] as String?
      ..userName = json['user_name'] as String?
      ..email = json['email'] as String?
      ..phone = json['phone'] as String?
      ..whatsApp = json['whats_app'] as String?
      ..image = json['image'] as String?
      ..gender = json['gender'] as String?
      ..parentName = json['parent_name'] as String?
      ..userCoupon = json['user_coupon'] as String?
      ..bonus = MyChildEntity.customInt(json['bonus'])
      ..childrens = json['childrens'] as List<dynamic>?
      ..age = MyChildEntity.customInt(json['age'])
      ..token = json['token'] as String?
      ..isGuest = json['is_guest'] as bool?
      ..fcmToken = json['fcm_token']
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..lastActiveAt = json['last_active_at']
      ..renewData = json['renew_data']
      ..statusLabel = json['status_label'] == null
          ? null
          : ChildrenStatusLabelModel.fromJson(
              json['status_label'] as Map<String, dynamic>,
            )
      ..programs = json['programs'] as List<dynamic>?
      ..chatId = json['chat_id'];

Map<String, dynamic> _$NewChildModelToJson(NewChildModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'user_name': instance.userName,
      'email': instance.email,
      'phone': instance.phone,
      'whats_app': instance.whatsApp,
      'image': instance.image,
      'gender': instance.gender,
      'parent_name': instance.parentName,
      'user_coupon': instance.userCoupon,
      'bonus': instance.bonus,
      'childrens': instance.childrens,
      'age': instance.age,
      'token': instance.token,
      'is_guest': instance.isGuest,
      'fcm_token': instance.fcmToken,
      'created_at': instance.createdAt?.toIso8601String(),
      'last_active_at': instance.lastActiveAt,
      'renew_data': instance.renewData,
      'status_label': instance.statusLabel?.toJson(),
      'programs': instance.programs,
      'chat_id': instance.chatId,
    };

StatusLabelModel _$StatusLabelModelFromJson(Map<String, dynamic> json) =>
    StatusLabelModel()
      ..label = json['label'] as String?
      ..color = json['color'] as String?
      ..key = json['key'] as String?;

Map<String, dynamic> _$StatusLabelModelToJson(StatusLabelModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'color': instance.color,
      'key': instance.key,
    };
