import 'package:eazifly_student/data/models/chat_model/send_messages_model.dart';
import 'package:json_annotation/json_annotation.dart';

class SendMessagesEntities {
  @JsonKey(name: "data")
  SendMessagesDataModel? data;
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

class SendMessagesDataEntities {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "chat_id")
  int? chatId;
  @JsonKey(name: "sender_type")
  String? senderType;
  @JsonKey(name: "message")
  String? message;
}
