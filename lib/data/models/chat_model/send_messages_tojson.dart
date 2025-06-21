class SendMessagesTojson {
  final String message;
  final String receiverId;
  final String receiverType;
  final String senderType;
  final String senderId;

  SendMessagesTojson({
    required this.message,
    required this.receiverId,
    required this.receiverType,
    required this.senderType,
    required this.senderId,
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
