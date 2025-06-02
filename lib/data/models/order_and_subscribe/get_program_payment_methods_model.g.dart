// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_program_payment_methods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProgramPaymentMethodsModel _$GetProgramPaymentMethodsModelFromJson(
        Map<String, dynamic> json) =>
    GetProgramPaymentMethodsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              ProgramPaymentMethodModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetProgramPaymentMethodsModelToJson(
        GetProgramPaymentMethodsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

ProgramPaymentMethodModel _$ProgramPaymentMethodModelFromJson(
        Map<String, dynamic> json) =>
    ProgramPaymentMethodModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..image = json['image'] as String?
      ..howToUse = json['how_to_use']
      ..payOn = json['pay_on'] as String?
      ..programId = json['program_id'] as String?;

Map<String, dynamic> _$ProgramPaymentMethodModelToJson(
        ProgramPaymentMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'how_to_use': instance.howToUse,
      'pay_on': instance.payOn,
      'program_id': instance.programId,
    };
