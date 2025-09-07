// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_assigned_children_to_program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAssignedChildrenToProgramModel _$GetAssignedChildrenToProgramModelFromJson(
  Map<String, dynamic> json,
) => GetAssignedChildrenToProgramModel()
  ..data = (json['data'] as List<dynamic>?)
      ?.map(
        (e) => GetAssignedChildrenToProgramDatumModel.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetAssignedChildrenToProgramModelToJson(
  GetAssignedChildrenToProgramModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

GetAssignedChildrenToProgramDatumModel
_$GetAssignedChildrenToProgramDatumModelFromJson(Map<String, dynamic> json) =>
    GetAssignedChildrenToProgramDatumModel()
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
      ..childrens = json['childrens'] as List<dynamic>?
      ..age = json['age'] as String?
      ..token = json['token']
      ..isGuest = json['is_guest']
      ..fcmToken = json['fcm_token']
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..lastActiveAt = json['last_active_at']
      ..renewData = json['renew_data'] == null
          ? null
          : DateTime.parse(json['renew_data'] as String)
      ..statusLabel = json['status_label'] == null
          ? null
          : GetAssignedChildrenToProgramStatusLabelModel.fromJson(
              json['status_label'] as Map<String, dynamic>,
            )
      ..instructorAssiignedData = json['instructor_assiigned_data'] == null
          ? null
          : InstructorAssiignedDataModel.fromJson(
              json['instructor_assiigned_data'] as Map<String, dynamic>,
            )
      ..programs = (json['programs'] as List<dynamic>?)
          ?.map(
            (e) => GetAssignedChildrenToProgramProgramModel.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList()
      ..chatId = json['chat_id']
      ..nextSession = json['next_session'] == null
          ? null
          : GetAssignedChildrenNextSessionModel.fromJson(
              json['next_session'] as Map<String, dynamic>,
            )
      ..currentInstructorId = (json['current_instructor_id'] as num?)?.toInt()
      ..host = json['host'] as String?
      ..goalsPercentage = (json['goals_percentage'] as num?)?.toInt()
      ..contentId = json['content_id'] as String?
      ..expireDate = json['expire_date'] == null
          ? null
          : DateTime.parse(json['expire_date'] as String);

Map<String, dynamic> _$GetAssignedChildrenToProgramDatumModelToJson(
  GetAssignedChildrenToProgramDatumModel instance,
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
  'childrens': instance.childrens,
  'age': instance.age,
  'token': instance.token,
  'is_guest': instance.isGuest,
  'fcm_token': instance.fcmToken,
  'created_at': instance.createdAt?.toIso8601String(),
  'last_active_at': instance.lastActiveAt,
  'renew_data': instance.renewData?.toIso8601String(),
  'status_label': instance.statusLabel?.toJson(),
  'instructor_assiigned_data': instance.instructorAssiignedData?.toJson(),
  'programs': instance.programs?.map((e) => e.toJson()).toList(),
  'chat_id': instance.chatId,
  'next_session': instance.nextSession?.toJson(),
  'current_instructor_id': instance.currentInstructorId,
  'host': instance.host,
  'goals_percentage': instance.goalsPercentage,
  'content_id': instance.contentId,
  'expire_date': instance.expireDate?.toIso8601String(),
};

GetAssignedChildrenToProgramProgramModel
_$GetAssignedChildrenToProgramProgramModelFromJson(Map<String, dynamic> json) =>
    GetAssignedChildrenToProgramProgramModel()
      ..title = json['title'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$GetAssignedChildrenToProgramProgramModelToJson(
  GetAssignedChildrenToProgramProgramModel instance,
) => <String, dynamic>{'title': instance.title, 'image': instance.image};

InstructorAssiignedDataModel _$InstructorAssiignedDataModelFromJson(
  Map<String, dynamic> json,
) => InstructorAssiignedDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..name = json['name'] as String?
  ..phone = json['phone'] as String?
  ..image = json['image'] as String?;

Map<String, dynamic> _$InstructorAssiignedDataModelToJson(
  InstructorAssiignedDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'image': instance.image,
};

GetAssignedChildrenToProgramStatusLabelModel
_$GetAssignedChildrenToProgramStatusLabelModelFromJson(
  Map<String, dynamic> json,
) => GetAssignedChildrenToProgramStatusLabelModel()
  ..label = json['label'] as String?
  ..color = json['color'] as String?;

Map<String, dynamic> _$GetAssignedChildrenToProgramStatusLabelModelToJson(
  GetAssignedChildrenToProgramStatusLabelModel instance,
) => <String, dynamic>{'label': instance.label, 'color': instance.color};

GetAssignedChildrenNextSessionModel
_$GetAssignedChildrenNextSessionModelFromJson(Map<String, dynamic> json) =>
    GetAssignedChildrenNextSessionModel()
      ..id = (json['id'] as num?)?.toInt()
      ..instructorId = json['instructor_id'] as String?
      ..sessionDatetime = json['session_datetime'] == null
          ? null
          : DateTime.parse(json['session_datetime'] as String)
      ..duration = json['duration'] as String?
      ..meetingUrl = json['meeting_url'] as String?;

Map<String, dynamic> _$GetAssignedChildrenNextSessionModelToJson(
  GetAssignedChildrenNextSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'instructor_id': instance.instructorId,
  'session_datetime': instance.sessionDatetime?.toIso8601String(),
  'duration': instance.duration,
  'meeting_url': instance.meetingUrl,
};
