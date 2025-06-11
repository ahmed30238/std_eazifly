// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_favourite_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreFavouriteListModel _$StoreFavouriteListModelFromJson(
        Map<String, dynamic> json) =>
    StoreFavouriteListModel()
      ..data = json['data'] == null
          ? null
          : StoreFavouriteDataModel.fromJson(
              json['data'] as Map<String, dynamic>)
      ..status = (json['status'] as num?)?.toInt()
      ..message = json['message'] as String?;

Map<String, dynamic> _$StoreFavouriteListModelToJson(
        StoreFavouriteListModel instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'status': instance.status,
      'message': instance.message,
    };

StoreFavouriteDataModel _$StoreFavouriteDataModelFromJson(
        Map<String, dynamic> json) =>
    StoreFavouriteDataModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..image = json['image'] as String?
      ..numberOfItems = (json['number_of_items'] as num?)?.toInt();

Map<String, dynamic> _$StoreFavouriteDataModelToJson(
        StoreFavouriteDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'number_of_items': instance.numberOfItems,
    };
