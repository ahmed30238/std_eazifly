import 'package:json_annotation/json_annotation.dart';

import '../../../data/models/geidea_settings_model/get_geidea_data_model.dart';

class GetGeideaDataEntity {
  @JsonKey(name: "data")
  KeyDataModel? data;

  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  GetGeideaDataEntity({
    this.data,
    this.status,
    this.message,
  });
}

class KeyDataEntity {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "key")
  String? key;

  @JsonKey(name: "value")
  String? value;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "label_name")
  String? labelName;

  KeyDataEntity({
    this.id,
    this.key,
    this.value,
    this.type,
    this.labelName,
  });
}
