// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_library_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowLibraryItemModel _$ShowLibraryItemModelFromJson(
        Map<String, dynamic> json) =>
    ShowLibraryItemModel()
      ..data = json['data'] == null
          ? null
          : LibraryItemModel.fromJson(json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$ShowLibraryItemModelToJson(
        ShowLibraryItemModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

LibraryItemModel _$LibraryItemModelFromJson(Map<String, dynamic> json) =>
    LibraryItemModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..description = json['description'] as String?
      ..image = json['image'] as String?
      ..file = json['file'] as String?
      ..fileType = json['file_type'] as String?
      ..libraryListId = ItemEntity.customInt(json['library_list_id'])
      ..paymentType = json['payment_type'] as String?
      ..itemType = json['item_type'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String)
      ..liked = json['liked'] as bool?;

Map<String, dynamic> _$LibraryItemModelToJson(LibraryItemModel instance) =>
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
