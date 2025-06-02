// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_library_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLibraryCategoriesModel _$GetLibraryCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    GetLibraryCategoriesModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              LibraryCategoryDatumModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetLibraryCategoriesModelToJson(
        GetLibraryCategoriesModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

LibraryCategoryDatumModel _$LibraryCategoryDatumModelFromJson(
        Map<String, dynamic> json) =>
    LibraryCategoryDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..type = json['type'] as String?
      ..lists = (json['lists'] as List<dynamic>?)
          ?.map((e) =>
              LibraryListElementModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$LibraryCategoryDatumModelToJson(
        LibraryCategoryDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'lists': instance.lists?.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

LibraryListElementModel _$LibraryListElementModelFromJson(
        Map<String, dynamic> json) =>
    LibraryListElementModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..image = json['image'] as String?
      ..file = json['file'] as String?
      ..fileType = json['file_type'] as String?
      ..libraryCategoryId = json['library_category_id'] as String?
      ..libraryCategory = json['library_category'] as String?
      ..totalItems = (json['total_items'] as num?)?.toInt()
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$LibraryListElementModelToJson(
        LibraryListElementModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'file': instance.file,
      'file_type': instance.fileType,
      'library_category_id': instance.libraryCategoryId,
      'library_category': instance.libraryCategory,
      'total_items': instance.totalItems,
      'created_at': instance.createdAt?.toIso8601String(),
    };
