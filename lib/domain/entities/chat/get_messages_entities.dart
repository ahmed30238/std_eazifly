import 'package:eazifly_student/data/models/chat_model/get_messages_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GetMessagesEntities {
  @JsonKey(name: "data")
  List<GetMessagesDatumModel>? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

class GetMessagesDatumEntities {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "chat_id")
  int? chatId;
  @JsonKey(name: "sender_type")
  String? senderType;
  @JsonKey(name: "message")
  String? message;
  GetMessagesDatumEntities({
    this.id,
    this.chatId,
    this.senderType,
    this.message,
  });
}
