import 'package:eazifly_student/domain/entities/check_copoun_entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_copoun_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CheckCopounModel extends CheckCopounEntity {
  CheckCopounModel();

  factory CheckCopounModel.fromJson(Map<String, dynamic> json) =>
      _$CheckCopounModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckCopounModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckCopounDataModel extends CheckCopounDataEntity {
  CheckCopounDataModel();

  factory CheckCopounDataModel.fromJson(Map<String, dynamic> json) =>
      _$CheckCopounDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckCopounDataModelToJson(this);
}
