// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileModel _$UpdateProfileModelFromJson(Map<String, dynamic> json) =>
    UpdateProfileModel()
      ..data = json['data'] == null
          ? null
          : UpdateProfileDataModel.fromJson(
              json['data'] as Map<String, dynamic>,
            )
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$UpdateProfileModelToJson(UpdateProfileModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

UpdateProfileDataModel _$UpdateProfileDataModelFromJson(
  Map<String, dynamic> json,
) => UpdateProfileDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..firstName = json['first_name'] as String?
  ..lastName = json['last_name'] as String?
  ..userName = json['user_name'] as String?
  ..email = json['email'] as String?
  ..parentId = UpdateProfileDataEntity.customInt(json['parent_id'])
  ..phone = json['phone'] as String?
  ..whatsApp = json['whats_app'] as String?
  ..image = json['image'] as String?
  ..gender = json['gender'] as String?
  ..parentName = json['parent_name'] as String?
  ..userCoupon = json['user_coupon'] as String?
  ..bonus = UpdateProfileDataEntity.customInt(json['bonus'])
  ..childrens = (json['childrens'] as List<dynamic>?)
      ?.map((e) => UpdateProfileDataModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..age = UpdateProfileDataEntity.customInt(json['age'])
  ..token = json['token']
  ..isGuest = json['is_guest']
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
  ..instructorAssiignedData = json['instructor_assigned_data']
  ..statusLabel = json['status_label'] == null
      ? null
      : UpdateProfileStatusLabelModel.fromJson(
          json['status_label'] as Map<String, dynamic>,
        )
  ..programs = (json['programs'] as List<dynamic>?)
      ?.map(
        (e) => UpdateProfileProgramModel.fromJson(e as Map<String, dynamic>),
      )
      .toList()
  ..chatId = UpdateProfileDataEntity.customInt(json['chat_id']);

Map<String, dynamic> _$UpdateProfileDataModelToJson(
  UpdateProfileDataModel instance,
) => <String, dynamic>{
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
  'instructor_assigned_data': instance.instructorAssiignedData,
  'status_label': instance.statusLabel?.toJson(),
  'programs': instance.programs?.map((e) => e.toJson()).toList(),
  'chat_id': instance.chatId,
};

UpdateProfileProgramModel _$UpdateProfileProgramModelFromJson(
  Map<String, dynamic> json,
) => UpdateProfileProgramModel()
  ..title = json['title'] as String?
  ..image = json['image'] as String?;

Map<String, dynamic> _$UpdateProfileProgramModelToJson(
  UpdateProfileProgramModel instance,
) => <String, dynamic>{'title': instance.title, 'image': instance.image};

UpdateProfileStatusLabelModel _$UpdateProfileStatusLabelModelFromJson(
  Map<String, dynamic> json,
) => UpdateProfileStatusLabelModel()
  ..label = json['label'] as String?
  ..color = json['color'] as String?
  ..key = json['key'] as String?;

Map<String, dynamic> _$UpdateProfileStatusLabelModelToJson(
  UpdateProfileStatusLabelModel instance,
) => <String, dynamic>{
  'label': instance.label,
  'color': instance.color,
  'key': instance.key,
};
