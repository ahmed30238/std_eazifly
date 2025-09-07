// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_fcm_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFcmTokenModel _$UpdateFcmTokenModelFromJson(Map<String, dynamic> json) =>
    UpdateFcmTokenModel()
      ..data = json['data']
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$UpdateFcmTokenModelToJson(
  UpdateFcmTokenModel instance,
) => <String, dynamic>{
  'data': instance.data,
  'status': instance.status,
  'message': instance.message,
};
