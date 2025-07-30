import 'package:eazifly_student/domain/entities/user/copoun_history_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'copoun_history_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CopounHistoryModel extends CopounHistoryEntity {
  CopounHistoryModel();

  factory CopounHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$CopounHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CopounHistoryModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CopounHistoryDatumModel extends CopounHistoryDatumEntity {
  CopounHistoryDatumModel();

  factory CopounHistoryDatumModel.fromJson(Map<String, dynamic> json) =>
      _$CopounHistoryDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$CopounHistoryDatumModelToJson(this);
}