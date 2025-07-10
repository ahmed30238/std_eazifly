import 'package:eazifly_student/domain/entities/chat/get_my_chats_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_my_chats_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetMyChatsModel extends GetMyChatsEntity {
  GetMyChatsModel();

  factory GetMyChatsModel.fromJson(Map<String, dynamic> json) =>
      _$GetMyChatsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyChatsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMyChatsDatumModel extends GetMyChatsDatumEntity {
  GetMyChatsDatumModel();

  factory GetMyChatsDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetMyChatsDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyChatsDatumModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMyChatsLatestMessageModel extends GetMyChatsLatestMessageEntity {
  GetMyChatsLatestMessageModel();

  factory GetMyChatsLatestMessageModel.fromJson(Map<String, dynamic> json) =>
      _$GetMyChatsLatestMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyChatsLatestMessageModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMyChatsParticipantModel extends GetMyChatsParticipantEntity {
  GetMyChatsParticipantModel();

  factory GetMyChatsParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$GetMyChatsParticipantModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyChatsParticipantModelToJson(this);
}
