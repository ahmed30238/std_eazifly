import 'package:eazifly_student/domain/entities/chat/send_messages_entities.dart';
import 'package:json_annotation/json_annotation.dart';
part 'send_messages_model.g.dart';


@JsonSerializable(explicitToJson: true)
class SendMessagesModel extends SendMessagesEntities {
  SendMessagesModel();

  factory SendMessagesModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessagesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessagesDataModel extends SendMessagesDataEntities {
  SendMessagesDataModel();

  factory SendMessagesDataModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessagesDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessagesDataModelToJson(this);
}
@JsonSerializable(explicitToJson: true)
class SendMessagesSenderModel extends SendMessagesSenderEntity {
  SendMessagesSenderModel();

  factory SendMessagesSenderModel.fromJson(Map<String, dynamic> json) =>
      _$SendMessagesSenderModelFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessagesSenderModelToJson(this);
}
