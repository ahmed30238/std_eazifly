// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_program_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProgramContentModel _$GetProgramContentModelFromJson(
        Map<String, dynamic> json) =>
    GetProgramContentModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              ProgramContentDatumModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetProgramContentModelToJson(
        GetProgramContentModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

ProgramContentDatumModel _$ProgramContentDatumModelFromJson(
        Map<String, dynamic> json) =>
    ProgramContentDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?;

Map<String, dynamic> _$ProgramContentDatumModelToJson(
        ProgramContentDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
