import 'package:eazifly_student/domain/entities/chat/get_messages_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_messages_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetMessagesModel extends GetMessagesEntities {
  GetMessagesModel();

  factory GetMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$GetMessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessagesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessagesDatumModel extends GetMessagesDatumEntities {
  GetMessagesDatumModel();

  factory GetMessagesDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetMessagesDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessagesDatumModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessagesSenderModel extends GetMessagesSenderEntities {
  GetMessagesSenderModel();

  factory GetMessagesSenderModel.fromJson(Map<String, dynamic> json) =>
      _$GetMessagesSenderModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessagesSenderModelToJson(this);
}
