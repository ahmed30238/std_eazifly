// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_list_items_using_list_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListItemsUsingListIdModel _$GetListItemsUsingListIdModelFromJson(
        Map<String, dynamic> json) =>
    GetListItemsUsingListIdModel()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => ListItemModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$GetListItemsUsingListIdModelToJson(
        GetListItemsUsingListIdModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'message': instance.message,
    };

ListItemModel _$ListItemModelFromJson(Map<String, dynamic> json) =>
    ListItemModel()
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

Map<String, dynamic> _$ListItemModelToJson(ListItemModel instance) =>
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
