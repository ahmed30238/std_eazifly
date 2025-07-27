class SendMessagesTojson {
  final String message;
  final String receiverId;
  final String receiverType;
  final String senderType;
  final String senderId;
  final String? createdAt;

  SendMessagesTojson({
    required this.message,
    required this.receiverId,
    required this.receiverType,
    required this.senderType,
    required this.senderId,
    this.createdAt
  });
  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "receiver_id": receiverId,
      "receiver_type": receiverType,
      "sender_type": senderType,
      "sender_id": senderId,
    };
  }
}
