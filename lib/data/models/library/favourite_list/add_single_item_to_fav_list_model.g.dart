// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_single_item_to_fav_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSingleItemToFavListModel _$AddSingleItemToFavListModelFromJson(
  Map<String, dynamic> json,
) => AddSingleItemToFavListModel()
  ..data = json['data'] == null
      ? null
      : FavouriteDatumModel.fromJson(json['data'] as Map<String, dynamic>)
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$AddSingleItemToFavListModelToJson(
  AddSingleItemToFavListModel instance,
) => <String, dynamic>{
  'data': instance.data?.toJson(),
  'status': instance.status,
  'message': instance.message,
};

FavItemModel _$FavItemModelFromJson(Map<String, dynamic> json) => FavItemModel()
  ..id = (json['id'] as num?)?.toInt()
  ..title = json['title'] as String?
  ..image = json['image'] as String?
  ..numberOfItems = (json['number_of_items'] as num?)?.toInt();

Map<String, dynamic> _$FavItemModelToJson(FavItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'number_of_items': instance.numberOfItems,
    };
