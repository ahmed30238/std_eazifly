import 'package:eazifly_student/presentation/controller/chats/message_ui_model.dart';

abstract class ChatsState {}

class ChatsInitial extends ChatsState {}

class PickImageFromGallerySuccessState extends ChatsState {}

class ChangeTapbarState extends ChatsState {}

class GetGalleryImagesState extends ChatsState {}

class RecordState extends ChatsState {}

class RecordSecondState extends ChatsState {}

class RecordThirdState extends ChatsState {}

// GetMyChats States
class GetMyChatsLoadingState extends ChatsState {}

class GetMyChatsSuccessState extends ChatsState {}

class GetMyChatsErrorState extends ChatsState {
  final String message;
  GetMyChatsErrorState(this.message);
}

class StartRecordState extends ChatsState {}

class StopRecordState extends ChatsState {}

class StopPlayingRecordState extends ChatsState {}

class PlayRecordState extends ChatsState {}

class ReceivingNewMessageState extends ChatsState {}

class MessageTextChanged extends ChatsState {}

class GetMesssagesSuccesState extends ChatsState {
  final List<MessageUIModel> uiMessages;
  GetMesssagesSuccesState({required this.uiMessages});
}

class GetUiMesssagesSuccesState extends ChatsState {
  final List<MessageUIModel> uiMessages;

  GetUiMesssagesSuccesState({required this.uiMessages});
}

class GetMesssagesLoadingState extends ChatsState {}

class GetMessagesErrorState extends ChatsState {
  final String errorMessage;

  GetMessagesErrorState({required this.errorMessage});
}

class SendMesssagesSuccesState extends ChatsState {}

class SendMesssagesLoadingState extends ChatsState {}

class SendMessagesErrorState extends ChatsState {
  final String errorMessage;

  SendMessagesErrorState({required this.errorMessage});
}

class GetMyStudentsSuccessState extends ChatsState {}

class GetMyStudentsLoadingState extends ChatsState {}

class GetMyStudentsErrorState extends ChatsState {
  final String errorMessage;

  GetMyStudentsErrorState({required this.errorMessage});
}

class GetOldChatsSuccessState extends ChatsState {}

class GetOldChatsLoadingState extends ChatsState {}

class GetOldChatsErrorState extends ChatsState {
  final String errorMessage;

  GetOldChatsErrorState({required this.errorMessage});
}
