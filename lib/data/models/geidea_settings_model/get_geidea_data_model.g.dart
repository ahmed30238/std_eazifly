// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_geidea_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetGeideaDataModel _$GetGeideaDataModelFromJson(Map<String, dynamic> json) =>
    GetGeideaDataModel()
      ..data = json['data'] == null
          ? null
          : KeyDataModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetGeideaDataModelToJson(GetGeideaDataModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

KeyDataModel _$KeyDataModelFromJson(Map<String, dynamic> json) => KeyDataModel()
  ..id = (json['id'] as num?)?.toInt()
  ..key = json['key'] as String?
  ..value = json['value'] as String?
  ..type = json['type'] as String?
  ..labelName = json['label_name'] as String?;

Map<String, dynamic> _$KeyDataModelToJson(KeyDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'value': instance.value,
      'type': instance.type,
      'label_name': instance.labelName,
    };
