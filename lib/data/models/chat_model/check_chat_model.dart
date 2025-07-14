import 'package:eazifly_student/domain/entities/chat/check_chat_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_chat_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckChatModel extends CheckChatEntity {
  CheckChatModel();

  factory CheckChatModel.fromJson(Map<String, dynamic> json) =>
      _$CheckChatModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckChatModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckChatDataModel extends CheckChatData {
  CheckChatDataModel();

  factory CheckChatDataModel.fromJson(Map<String, dynamic> json) =>
      _$CheckChatDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckChatDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckChatLatestMessageModel extends CheckChatLatestMessage {
  CheckChatLatestMessageModel();

  factory CheckChatLatestMessageModel.fromJson(Map<String, dynamic> json) =>
      _$CheckChatLatestMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckChatLatestMessageModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckChatParticipantModel extends CheckChatParticipant {
  CheckChatParticipantModel();

  factory CheckChatParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$CheckChatParticipantModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckChatParticipantModelToJson(this);
}