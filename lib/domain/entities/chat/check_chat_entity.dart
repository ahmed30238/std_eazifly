import 'package:eazifly_student/data/models/chat_model/check_chat_model.dart';
import 'package:json_annotation/json_annotation.dart';

class CheckChatEntity {
  @JsonKey(name: "data")
  CheckChatDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  CheckChatEntity({
    this.data,
    this.status,
    this.message,
  });
}

class CheckChatData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "participant1")
  CheckChatParticipantModel? participant1;
  @JsonKey(name: "participant2")
  CheckChatParticipantModel? participant2;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "latest_message")
  CheckChatLatestMessageModel? latestMessage;

  CheckChatData({
    this.id,
    this.participant1,
    this.participant2,
    this.createdAt,
    this.latestMessage,
  });
}

class CheckChatLatestMessage {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "chat_id")
  int? chatId;
  @JsonKey(name: "sender_type")
  String? senderType;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "created_at")
  DateTime? createdAt;

  CheckChatLatestMessage({
    this.id,
    this.chatId,
    this.senderType,
    this.message,
    this.createdAt,
  });
}

class CheckChatParticipant {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;

  CheckChatParticipant({
    this.type,
    this.id,
    this.name,
    this.image,
  });
}