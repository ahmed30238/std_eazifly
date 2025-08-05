
// في message_ui_model.dart - لو موجود
import 'package:eazifly_student/data/models/chat_model/get_messages_model.dart';

class MessageUIModel {
  final GetMessagesDatumModel message;
  final bool isSending;
  final bool isFailed;
  final String? messageType; // إضافة جديدة

  MessageUIModel({
    required this.message,
    this.isSending = false,
    this.isFailed = false,
    this.messageType,
  });

  MessageUIModel copyWith({
    GetMessagesDatumModel? message,
    bool? isSending,
    bool? isFailed,
    String? messageType,
  }) {
    return MessageUIModel(
      message: message ?? this.message,
      isSending: isSending ?? this.isSending,
      isFailed: isFailed ?? this.isFailed,
      messageType: messageType ?? this.messageType,
    );
  }
}