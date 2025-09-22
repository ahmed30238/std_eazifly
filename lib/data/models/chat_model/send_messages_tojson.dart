class SendMessagesTojson {
  final String? message;
  final String? receiverId;
  final String? receiverType;
  final String senderType;
  final String senderId;
  final String? createdAt;
  final String? file;
  final String? type;
  final String? chatId;

  SendMessagesTojson({
    this.message,
    this.receiverId,
    this.receiverType,
    required this.senderType,
    required this.senderId,
    required this.createdAt,
    required this.file,
    this.type,
    this.chatId,
  });

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "receiver_id": receiverId,
      "receiver_type": receiverType,
      "sender_type": senderType,
      "sender_id": senderId,
      "file": file,
      "type": type,
      "chat_id": chatId,
    };
  }
}
