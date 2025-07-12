// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAccountModel _$DeleteAccountModelFromJson(Map<String, dynamic> json) =>
    DeleteAccountModel()
      ..data = json['data']
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$DeleteAccountModelToJson(DeleteAccountModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'message': instance.message,
    };
