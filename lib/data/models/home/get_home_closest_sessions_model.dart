import 'package:eazifly_student/domain/entities/home/get_home_closest_sessions_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_home_closest_sessions_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetHomeClosestSessionsModel extends GetHomeClosestSessionsEntity {
  GetHomeClosestSessionsModel();

  factory GetHomeClosestSessionsModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeClosestSessionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeClosestSessionsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeClosestSessionsDatumModel extends GetHomeClosestSessionsDatum {
  GetHomeClosestSessionsDatumModel();

  factory GetHomeClosestSessionsDatumModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetHomeClosestSessionsDatumModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetHomeClosestSessionsDatumModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeClosestSessionsUserModel extends GetHomeClosestSessionsUser {
  GetHomeClosestSessionsUserModel();

  factory GetHomeClosestSessionsUserModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeClosestSessionsUserModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetHomeClosestSessionsUserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeClosestSessionStatusModel extends GetHomeClosestSessionStatus {
  GetHomeClosestSessionStatusModel();

  factory GetHomeClosestSessionStatusModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetHomeClosestSessionStatusModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetHomeClosestSessionStatusModelToJson(this);
}
