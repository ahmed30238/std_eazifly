class CheckChatTojson {
  final String senderType;
  final String senderId;
  final String receiverId;
  final String receiverType;

  CheckChatTojson({
    required this.senderType,
    required this.senderId,
    required this.receiverId,
    required this.receiverType,
  });
  Map<String, dynamic> toJson() {
    return {
      'sender_type': senderType,
      'sender_id': senderId,
      'receiver_id': receiverId,
      'receiver_type': receiverType,
    };
  }
}
