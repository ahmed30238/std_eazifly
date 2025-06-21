// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_messages_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessagesModel _$SendMessagesModelFromJson(Map<String, dynamic> json) =>
    SendMessagesModel()
      ..data = json['data'] == null
          ? null
          : SendMessagesDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$SendMessagesModelToJson(SendMessagesModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

SendMessagesDataModel _$SendMessagesDataModelFromJson(
        Map<String, dynamic> json) =>
    SendMessagesDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..chatId = (json['chat_id'] as num?)?.toInt()
      ..senderType = json['sender_type'] as String?
      ..message = json['message'] as String?;

Map<String, dynamic> _$SendMessagesDataModelToJson(
        SendMessagesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chat_id': instance.chatId,
      'sender_type': instance.senderType,
      'message': instance.message,
    };
