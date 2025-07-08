// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_library_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeLibraryModel _$GetHomeLibraryModelFromJson(Map<String, dynamic> json) =>
    GetHomeLibraryModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetHomeLibraryDatumModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetHomeLibraryModelToJson(
        GetHomeLibraryModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

GetHomeLibraryDatumModel _$GetHomeLibraryDatumModelFromJson(
        Map<String, dynamic> json) =>
    GetHomeLibraryDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..type = json['type'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..items = json['items'] == null
          ? null
          : GetHomeLibraryItemsModel.fromJson(
              json['items'] as Map<String, dynamic>);

Map<String, dynamic> _$GetHomeLibraryDatumModelToJson(
        GetHomeLibraryDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'created_at': instance.createdAt?.toIso8601String(),
      'items': instance.items?.toJson(),
    };

GetHomeLibraryItemsModel _$GetHomeLibraryItemsModelFromJson(
        Map<String, dynamic> json) =>
    GetHomeLibraryItemsModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetHomeLibraryItemsDatumModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..meta = json['meta'] == null
          ? null
          : GetHomeLibraryMetaModel.fromJson(
              json['meta'] as Map<String, dynamic>);

Map<String, dynamic> _$GetHomeLibraryItemsModelToJson(
        GetHomeLibraryItemsModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'meta': instance.meta?.toJson(),
    };

GetHomeLibraryItemsDatumModel _$GetHomeLibraryItemsDatumModelFromJson(
        Map<String, dynamic> json) =>
    GetHomeLibraryItemsDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..image = json['image'] as String?
      ..file = json['file'] as String?
      ..fileType = json['file_type'] as String?
      ..libraryListId = json['library_list_id'] as String?
      ..paymentType = json['payment_type'] as String?
      ..itemType = json['item_type'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..liked = json['liked'] as bool?;

Map<String, dynamic> _$GetHomeLibraryItemsDatumModelToJson(
        GetHomeLibraryItemsDatumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'file': instance.file,
      'file_type': instance.fileType,
      'library_list_id': instance.libraryListId,
      'payment_type': instance.paymentType,
      'item_type': instance.itemType,
      'created_at': instance.createdAt?.toIso8601String(),
      'liked': instance.liked,
    };

GetHomeLibraryMetaModel _$GetHomeLibraryMetaModelFromJson(
        Map<String, dynamic> json) =>
    GetHomeLibraryMetaModel()
      ..currentPage = (json['current_page'] as num?)?.toInt()
      ..lastPage = (json['last_page'] as num?)?.toInt()
      ..perPage = (json['per_page'] as num?)?.toInt()
      ..total = (json['total'] as num?)?.toInt();

Map<String, dynamic> _$GetHomeLibraryMetaModelToJson(
        GetHomeLibraryMetaModel instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
    };
