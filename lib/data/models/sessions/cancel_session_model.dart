import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:eazifly_student/domain/entities/sessions/cancel_session_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cancel_session_model.g.dart';


@JsonSerializable(explicitToJson: true)
class CancelSessionModel extends CancelSessionEntity {
  CancelSessionModel();

  factory CancelSessionModel.fromJson(Map<String, dynamic> json) =>
      _$CancelSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CancelSessionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CancelSessionDataModel extends CancelSessionDataEntity {
  CancelSessionDataModel();

  factory CancelSessionDataModel.fromJson(Map<String, dynamic> json) =>
      _$CancelSessionDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CancelSessionDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CancelSessionUserModel extends CancelSessionUserEntity {
  CancelSessionUserModel();

  factory CancelSessionUserModel.fromJson(Map<String, dynamic> json) =>
      _$CancelSessionUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$CancelSessionUserModelToJson(this);
}
@JsonSerializable(explicitToJson: true)
class CancelSessionStatusModel extends StatusLabelEntity {
  CancelSessionStatusModel();

  factory CancelSessionStatusModel.fromJson(Map<String, dynamic> json) =>
      _$CancelSessionStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$CancelSessionStatusModelToJson(this);
}
