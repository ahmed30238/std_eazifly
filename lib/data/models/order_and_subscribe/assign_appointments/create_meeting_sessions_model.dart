import 'package:eazifly_student/domain/entities/create_meeting_sessions_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_meeting_sessions_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateMeetingSessionsModel extends CreateMeetingSessionsEntity {
  CreateMeetingSessionsModel();

  factory CreateMeetingSessionsModel.fromJson(Map<String, dynamic> json) =>
      _$CreateMeetingSessionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMeetingSessionsModelToJson(this);
}
