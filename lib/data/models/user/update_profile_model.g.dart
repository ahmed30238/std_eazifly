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
              json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$UpdateProfileModelToJson(UpdateProfileModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

UpdateProfileDataModel _$UpdateProfileDataModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..userName = json['userName'] as String?
      ..email = json['email'] as String?
      ..parentId = json['parentId'] as String?
      ..phone = json['phone'] as String?
      ..whatsApp = json['whatsApp'] as String?
      ..image = json['image'] as String?
      ..gender = json['gender'] as String?
      ..parentName = json['parentName'] as String?
      ..userCoupon = json['userCoupon'] as String?
      ..bonus = json['bonus'] as String?
      ..childrens = (json['childrens'] as List<dynamic>?)
          ?.map(
              (e) => UpdateProfileDataModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..age = json['age'] as String?
      ..token = json['token']
      ..isGuest = json['isGuest']
      ..fcmToken = json['fcmToken']
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..lastActiveAt = json['lastActiveAt'] == null
          ? null
          : DateTime.parse(json['lastActiveAt'] as String)
      ..renewData = json['renewData'] == null
          ? null
          : DateTime.parse(json['renewData'] as String)
      ..instructorAssiignedData = json['instructorAssiignedData']
      ..statusLabel = json['statusLabel'] == null
          ? null
          : UpdateProfileStatusLabelModel.fromJson(
              json['statusLabel'] as Map<String, dynamic>)
      ..programs = (json['programs'] as List<dynamic>?)
          ?.map((e) =>
              UpdateProfileProgramModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..chatId = json['chatId'];

Map<String, dynamic> _$UpdateProfileDataModelToJson(
        UpdateProfileDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'email': instance.email,
      'parentId': instance.parentId,
      'phone': instance.phone,
      'whatsApp': instance.whatsApp,
      'image': instance.image,
      'gender': instance.gender,
      'parentName': instance.parentName,
      'userCoupon': instance.userCoupon,
      'bonus': instance.bonus,
      'childrens': instance.childrens?.map((e) => e.toJson()).toList(),
      'age': instance.age,
      'token': instance.token,
      'isGuest': instance.isGuest,
      'fcmToken': instance.fcmToken,
      'createdAt': instance.createdAt?.toIso8601String(),
      'lastActiveAt': instance.lastActiveAt?.toIso8601String(),
      'renewData': instance.renewData?.toIso8601String(),
      'instructorAssiignedData': instance.instructorAssiignedData,
      'statusLabel': instance.statusLabel?.toJson(),
      'programs': instance.programs?.map((e) => e.toJson()).toList(),
      'chatId': instance.chatId,
    };

UpdateProfileProgramModel _$UpdateProfileProgramModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileProgramModel()
      ..title = json['title'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$UpdateProfileProgramModelToJson(
        UpdateProfileProgramModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image': instance.image,
    };

UpdateProfileStatusLabelModel _$UpdateProfileStatusLabelModelFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileStatusLabelModel()
      ..label = json['label'] as String?
      ..color = json['color'] as String?
      ..key = json['key'] as String?;

Map<String, dynamic> _$UpdateProfileStatusLabelModelToJson(
        UpdateProfileStatusLabelModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'color': instance.color,
      'key': instance.key,
    };
