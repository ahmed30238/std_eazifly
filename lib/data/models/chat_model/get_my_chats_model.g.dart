// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_chats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyChatsModel _$GetMyChatsModelFromJson(Map<String, dynamic> json) =>
    GetMyChatsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => GetMyChatsDatumModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetMyChatsModelToJson(GetMyChatsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetMyChatsDatumModel _$GetMyChatsDatumModelFromJson(
  Map<String, dynamic> json,
) => GetMyChatsDatumModel()
  ..id = (json['id'] as num?)?.toInt()
  ..participant1 = json['participant1'] == null
      ? null
      : GetMyChatsParticipantModel.fromJson(
          json['participant1'] as Map<String, dynamic>,
        )
  ..participant2 = json['participant2'] == null
      ? null
      : GetMyChatsParticipantModel.fromJson(
          json['participant2'] as Map<String, dynamic>,
        )
  ..createdAt = json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String)
  ..latestMessage = json['latest_message'] == null
      ? null
      : GetMyChatsLatestMessageModel.fromJson(
          json['latest_message'] as Map<String, dynamic>,
        );

Map<String, dynamic> _$GetMyChatsDatumModelToJson(
  GetMyChatsDatumModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'participant1': instance.participant1?.toJson(),
  'participant2': instance.participant2?.toJson(),
  'created_at': instance.createdAt?.toIso8601String(),
  'latest_message': instance.latestMessage?.toJson(),
};

GetMyChatsLatestMessageModel _$GetMyChatsLatestMessageModelFromJson(
  Map<String, dynamic> json,
) => GetMyChatsLatestMessageModel()
  ..id = (json['id'] as num?)?.toInt()
  ..chatId = (json['chat_id'] as num?)?.toInt()
  ..senderType = json['sender_type'] as String?
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetMyChatsLatestMessageModelToJson(
  GetMyChatsLatestMessageModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'chat_id': instance.chatId,
  'sender_type': instance.senderType,
  'message': instance.message,
};

GetMyChatsParticipantModel _$GetMyChatsParticipantModelFromJson(
  Map<String, dynamic> json,
) => GetMyChatsParticipantModel()
  ..type = json['type'] as String?
  ..id = json['id'] as String?
  ..name = json['name'] as String?
  ..image = json['image'] as String?;

Map<String, dynamic> _$GetMyChatsParticipantModelToJson(
  GetMyChatsParticipantModel instance,
) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
