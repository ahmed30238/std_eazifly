enum MessageTypeEnum {
  text,
  image,
  voiceMessage,
}

class Message {
  final MessageTypeEnum type;
  final String content; // Could be text, image URL, or voice file path
  final bool isSender;
  final String createdAt;

  Message({
    required this.type,
    required this.content,
    required this.isSender,
    required this.createdAt,
  });
}
