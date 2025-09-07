import 'package:eazifly_student/domain/entities/sessions/change_session_date_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/children_entities/get_my_children_entity.dart';

part 'change_session_date_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ChangeSessionDateModel extends ChangeSessionDateEntity {
  ChangeSessionDateModel() : super();

  factory ChangeSessionDateModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeSessionDateModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeSessionDateModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangeSessionDateDataModel extends ChangeSessionDateDataEntity {
  ChangeSessionDateDataModel();

  factory ChangeSessionDateDataModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeSessionDateDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeSessionDateDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangeSessionDateUserModel extends ChangeSessionDateUserEntity {
  ChangeSessionDateUserModel();

  factory ChangeSessionDateUserModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeSessionDateUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeSessionDateUserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChangeSessionDateStatusModel extends StatusLabelEntity {
  ChangeSessionDateStatusModel();

  factory ChangeSessionDateStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeSessionDateStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeSessionDateStatusModelToJson(this);
}
