// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMessagesModel _$GetMessagesModelFromJson(Map<String, dynamic> json) =>
    GetMessagesModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map(
              (e) => GetMessagesDatumModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetMessagesModelToJson(GetMessagesModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetMessagesDatumModel _$GetMessagesDatumModelFromJson(
        Map<String, dynamic> json) =>
    GetMessagesDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..chatId = (json['chat_id'] as num?)?.toInt()
      ..senderType = json['sender_type'] as String?
      ..message = json['message'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$GetMessagesDatumModelToJson(
        GetMessagesDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'sender_type': instance.senderType,
      'message': instance.message,
      'created_at': instance.createdAt?.toIso8601String(),
    };
