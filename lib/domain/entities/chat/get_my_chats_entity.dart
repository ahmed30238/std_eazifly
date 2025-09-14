import 'package:eazifly_student/data/models/chat_model/get_my_chats_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetMyChatsEntity {
  @JsonKey(name: "data")
  List<GetMyChatsDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

  GetMyChatsEntity({this.data, this.status, this.message});
}

class GetMyChatsDatumEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "participant1")
  GetMyChatsParticipantModel? participant1;
  @JsonKey(name: "participant2")
  GetMyChatsParticipantModel? participant2;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "latest_message")
  GetMyChatsLatestMessageModel? latestMessage;
  @JsonKey(name: "participants")
  List<GetMyChatsParticipantElementModel>? participants;

  GetMyChatsDatumEntity({
    this.id,
    this.participant1,
    this.participant2,
    this.createdAt,
    this.latestMessage,
    this.type,
    this.participants,
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
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "file")
  String? file;
  @JsonKey(name: "file_type")
  String? fileType;
  @JsonKey(name: "sender")
  GetMyChatsSenderModel? sender;

  GetMyChatsLatestMessageEntity({
    this.id,
    this.chatId,
    this.senderType,
    this.message,
    this.createdAt,
    this.file,
    this.fileType,
    this.sender,
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

  GetMyChatsParticipantEntity({this.type, this.id, this.name, this.image});
}

class GetMyChatsSenderEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;

  GetMyChatsSenderEntity({this.id, this.name, this.image});
}

class GetMyChatsParticipantElementEntity {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "chat_id")
  String? chatId;
  @JsonKey(name: "participant_type")
  String? participantType;
  @JsonKey(name: "participant_id")
  String? participantId;
  @JsonKey(name: "participant")
  GetMyChatsSenderModel? participant;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  GetMyChatsParticipantElementEntity({
    this.id,
    this.chatId,
    this.participantType,
    this.participantId,
    this.participant,
    this.createdAt,
    this.updatedAt,
  });
}
