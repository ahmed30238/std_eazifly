// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckChatModel _$CheckChatModelFromJson(Map<String, dynamic> json) =>
    CheckChatModel()
      ..data = json['data'] == null
          ? null
          : CheckChatDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$CheckChatModelToJson(CheckChatModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

CheckChatDataModel _$CheckChatDataModelFromJson(Map<String, dynamic> json) =>
    CheckChatDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..participant1 = json['participant1'] == null
          ? null
          : CheckChatParticipantModel.fromJson(
              json['participant1'] as Map<String, dynamic>,
            )
      ..participant2 = json['participant2'] == null
          ? null
          : CheckChatParticipantModel.fromJson(
              json['participant2'] as Map<String, dynamic>,
            )
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..latestMessage = json['latest_message'] == null
          ? null
          : CheckChatLatestMessageModel.fromJson(
              json['latest_message'] as Map<String, dynamic>,
            );

Map<String, dynamic> _$CheckChatDataModelToJson(CheckChatDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'participant1': instance.participant1?.toJson(),
      'participant2': instance.participant2?.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
      'latest_message': instance.latestMessage?.toJson(),
    };

CheckChatLatestMessageModel _$CheckChatLatestMessageModelFromJson(
  Map<String, dynamic> json,
) => CheckChatLatestMessageModel()
  ..id = (json['id'] as num?)?.toInt()
  ..chatId = (json['chat_id'] as num?)?.toInt()
  ..senderType = json['sender_type'] as String?
  ..message = json['message'] as String?
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$CheckChatLatestMessageModelToJson(
  CheckChatLatestMessageModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'chat_id': instance.chatId,
  'sender_type': instance.senderType,
  'message': instance.message,
  'created_at': instance.createdAt?.toIso8601String(),
};

CheckChatParticipantModel _$CheckChatParticipantModelFromJson(
  Map<String, dynamic> json,
) => CheckChatParticipantModel()
  ..type = json['type'] as String?
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..image = json['image'] as String?;

Map<String, dynamic> _$CheckChatParticipantModelToJson(
  CheckChatParticipantModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
