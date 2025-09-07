// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_library_plans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLibraryPlansModel _$GetLibraryPlansModelFromJson(
  Map<String, dynamic> json,
) => GetLibraryPlansModel()
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => LibraryPlanModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetLibraryPlansModelToJson(
  GetLibraryPlansModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

LibraryPlanModel _$LibraryPlanModelFromJson(Map<String, dynamic> json) =>
    LibraryPlanModel()
      ..id = (json['id'] as num?)?.toInt()
      ..price = (json['price'] as num?)?.toInt()
      ..days = (json['days'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..description = json['description'] as String?;

Map<String, dynamic> _$LibraryPlanModelToJson(LibraryPlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'days': instance.days,
      'title': instance.title,
      'description': instance.description,
    };
