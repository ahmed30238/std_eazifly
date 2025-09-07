// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_feedbacks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserFeedbacksModel _$GetUserFeedbacksModelFromJson(
  Map<String, dynamic> json,
) => GetUserFeedbacksModel()
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => UserFeedbackModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetUserFeedbacksModelToJson(
  GetUserFeedbacksModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

UserFeedbackModel _$UserFeedbackModelFromJson(Map<String, dynamic> json) =>
    UserFeedbackModel()
      ..id = (json['id'] as num?)?.toInt()
      ..instructor = json['instructor'] as String?
      ..client = json['client'] as String?
      ..user = json['user'] as String?
      ..feedback = json['feedback'] as String?
      ..date = json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String)
      ..isRead = json['is_read'] as bool?
      ..maker = json['maker'] as String?
      ..image = json['image'] as String?;

Map<String, dynamic> _$UserFeedbackModelToJson(UserFeedbackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'instructor': instance.instructor,
      'client': instance.client,
      'user': instance.user,
      'feedback': instance.feedback,
      'date': instance.date?.toIso8601String(),
      'is_read': instance.isRead,
      'maker': instance.maker,
      'image': instance.image,
    };
