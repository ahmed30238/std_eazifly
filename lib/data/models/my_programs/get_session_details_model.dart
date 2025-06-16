import 'package:eazifly_student/domain/entities/my_programs/get_session_details_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_session_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetSessionDetailsModel extends GetSessionDetailsEntity {
  GetSessionDetailsModel();

  factory GetSessionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$GetSessionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetSessionDetailsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SessionDetailsModel extends SessionDetailsEntity {
  SessionDetailsModel();

  factory SessionDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$SessionDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionDetailsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SessionUserModel extends SessionUserEntity {
  SessionUserModel();

  factory SessionUserModel.fromJson(Map<String, dynamic> json) =>
      _$SessionUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionUserModelToJson(this);
}
