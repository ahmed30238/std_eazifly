
import 'package:eazifly_student/data/models/chat_model/get_messages_model.dart';

class MessageUIModel {
  final GetMessagesDatumModel message;
  final bool isSending;
  final bool isFailed;

  MessageUIModel({
    required this.message,
    this.isSending = false,
    this.isFailed = false,
  });

  MessageUIModel copyWith({
    GetMessagesDatumModel? message,
    bool? isSending,
    bool? isFailed,
  }) {
    return MessageUIModel(
      message: message ?? this.message,
      isSending: isSending ?? this.isSending,
      isFailed: isFailed ?? this.isFailed,
    );
  }
}
