import 'package:eazifly_student/domain/entities/home/get_home_closest_sessions_entity.dart';
import 'package:eazifly_student/domain/entities/home/get_home_current_session_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_home_current_session_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetHomeCurrentSessionModel extends GetHomeCurrentSessionEntity {
  GetHomeCurrentSessionModel();

  factory GetHomeCurrentSessionModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeCurrentSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeCurrentSessionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeCurrentSessionDataModel extends GetHomeCurrentSessionData {
  GetHomeCurrentSessionDataModel();

  factory GetHomeCurrentSessionDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeCurrentSessionDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeCurrentSessionDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeCurrentSessionUserModel extends GetHomeCurrentSessionUser {
  GetHomeCurrentSessionUserModel();

  factory GetHomeCurrentSessionUserModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeCurrentSessionUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeCurrentSessionUserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeCurrentSessionStatusModel extends GetHomeClosestSessionStatus {
  GetHomeCurrentSessionStatusModel();

  factory GetHomeCurrentSessionStatusModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetHomeCurrentSessionStatusModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetHomeCurrentSessionStatusModelToJson(this);
}
