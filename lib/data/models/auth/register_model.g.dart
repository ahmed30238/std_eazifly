// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel()
      ..data = json['data'] == null
          ? null
          : RegisterDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

RegisterDataModel _$RegisterDataModelFromJson(Map<String, dynamic> json) =>
    RegisterDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..firstName = json['first_name'] as String?
      ..lastName = json['last_name'] as String?
      ..userName = json['user_name'] as String?
      ..email = json['email'] as String?
      ..parentId = RegisterDataEntity.customInt(json['parent_id'])
      ..phone = json['phone'] as String?
      ..whatsApp = json['whats_app'] as String?
      ..image = json['image'] as String?
      ..gender = json['gender'] as String?
      ..parentName = json['parent_name'] as String?
      ..userCoupon = json['user_coupon'] as String?
      ..bonus = RegisterDataEntity.customInt(json['bonus'])
      ..childrens = json['childrens'] as List<dynamic>?
      ..age = RegisterDataEntity.customInt(json['age'])
      ..token = json['token'] as String?
      ..isGuest = json['is_guest'] as bool?
      ..fcmToken = json['fcm_token'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..lastActiveAt = json['last_active_at']
      ..renewData = json['renew_data']
      ..instructorAssiignedData = json['instructor_assiigned_data']
      ..statusLabel = json['status_label'] == null
          ? null
          : RegisterStatusLabelModel.fromJson(
              json['status_label'] as Map<String, dynamic>)
      ..programs = json['programs'] as List<dynamic>?
      ..chatId = RegisterDataEntity.customInt(json['chat_id']);

Map<String, dynamic> _$RegisterDataModelToJson(RegisterDataModel instance) =>
    <String, dynamic>{
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
      'childrens': instance.childrens,
      'age': instance.age,
      'token': instance.token,
      'is_guest': instance.isGuest,
      'fcm_token': instance.fcmToken,
      'created_at': instance.createdAt?.toIso8601String(),
      'last_active_at': instance.lastActiveAt,
      'renew_data': instance.renewData,
      'instructor_assiigned_data': instance.instructorAssiignedData,
      'status_label': instance.statusLabel?.toJson(),
      'programs': instance.programs,
      'chat_id': instance.chatId,
    };

RegisterStatusLabelModel _$RegisterStatusLabelModelFromJson(
        Map<String, dynamic> json) =>
    RegisterStatusLabelModel()
      ..label = json['label'] as String?
      ..color = json['color'] as String?
      ..key = json['key'] as String?;

Map<String, dynamic> _$RegisterStatusLabelModelToJson(
        RegisterStatusLabelModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'color': instance.color,
      'key': instance.key,
    };
