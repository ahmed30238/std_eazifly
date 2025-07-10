import 'package:eazifly_student/data/models/chat_model/get_my_chats_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetMyChatsEntity {
  @JsonKey(name: "data")
  List<GetMyChatsDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetMyChatsEntity({
    this.data,
    this.status,
    this.message,
  });
}

class GetMyChatsDatumEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "participant1")
  GetMyChatsParticipantModel? participant1;
  @JsonKey(name: "participant2")
  GetMyChatsParticipantModel? participant2;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "latest_message")
  GetMyChatsLatestMessageModel? latestMessage;

  GetMyChatsDatumEntity({
    this.id,
    this.participant1,
    this.participant2,
    this.createdAt,
    this.latestMessage,
  });
}

class GetMyChatsLatestMessageEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "chat_id")
  int? chatId;
  @JsonKey(name: "sender_type")
  String? senderType;
  @JsonKey(name: "message")
  String? message;

  GetMyChatsLatestMessageEntity({
    this.id,
    this.chatId,
    this.senderType,
    this.message,
  });
}

class GetMyChatsParticipantEntity {
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;

  GetMyChatsParticipantEntity({
    this.type,
    this.id,
    this.name,
    this.image,
  });
}
