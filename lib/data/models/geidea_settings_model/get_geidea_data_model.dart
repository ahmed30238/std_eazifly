import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/get_geidea_settings/get_geidea_data_entity.dart';

part 'get_geidea_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetGeideaDataModel extends GetGeideaDataEntity {
  GetGeideaDataModel();

  factory GetGeideaDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetGeideaDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetGeideaDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class KeyDataModel extends KeyDataEntity {
  KeyDataModel();

  factory KeyDataModel.fromJson(Map<String, dynamic> json) =>
      _$KeyDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$KeyDataModelToJson(this);
}
