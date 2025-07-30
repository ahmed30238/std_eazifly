// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_instructors_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInstructorsModel _$GetInstructorsModelFromJson(Map<String, dynamic> json) =>
    GetInstructorsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetInstructorsInstructorModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetInstructorsModelToJson(
        GetInstructorsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetInstructorsInstructorModel _$GetInstructorsInstructorModelFromJson(
        Map<String, dynamic> json) =>
    GetInstructorsInstructorModel()
      ..id = (json['id'] as num?)?.toInt()
      ..nameEn = json['name_en'] as String?
      ..nameAr = json['name_ar'] as String?
      ..phone = json['phone'] as String?
      ..whatsApp = json['whats_app'] as String?
      ..address = json['address'] as String?
      ..age = GetInstructorsInstructorEntity.customInt(json['age'])
      ..gender = json['gender'] as String?
      ..image = json['image'] as String?
      ..specializations = (json['specializations'] as List<dynamic>?)
          ?.map((e) => GetInstructorsInstructorSpecializationsModel.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetInstructorsInstructorModelToJson(
        GetInstructorsInstructorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_ar': instance.nameAr,
      'phone': instance.phone,
      'whats_app': instance.whatsApp,
      'address': instance.address,
      'age': instance.age,
      'gender': instance.gender,
      'image': instance.image,
      'specializations':
          instance.specializations?.map((e) => e.toJson()).toList(),
    };

GetInstructorsInstructorSpecializationsModel
    _$GetInstructorsInstructorSpecializationsModelFromJson(
            Map<String, dynamic> json) =>
        GetInstructorsInstructorSpecializationsModel()
          ..id = (json['id'] as num?)?.toInt()
          ..name = json['name'] as String?;

Map<String, dynamic> _$GetInstructorsInstructorSpecializationsModelToJson(
        GetInstructorsInstructorSpecializationsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
