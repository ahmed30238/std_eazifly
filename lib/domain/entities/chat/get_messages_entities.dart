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
  static int? customInt(val) => int.tryParse(val?.toString() ?? "");
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "chat_id",fromJson: customInt)
  int? chatId;
  @JsonKey(name: "sender_type")
  String? senderType;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "file_type")
  String? fileType;
  @JsonKey(name: "file")
  String? file;
  @JsonKey(name: "sender")
  GetMessagesSenderModel? sender;

  GetMessagesDatumEntities({
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

class GetMessagesSenderEntities {
  int? id;
  String? name;
  String? image;

  GetMessagesSenderEntities({this.id, this.image, this.name});
}
