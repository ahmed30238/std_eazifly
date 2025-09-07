// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_favourite_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFavouriteListModel _$GetFavouriteListModelFromJson(
  Map<String, dynamic> json,
) => GetFavouriteListModel()
  ..data = (json['data'] as List<dynamic>?)
      ?.map((e) => FavouriteDatumModel.fromJson(e as Map<String, dynamic>))
      .toList()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$GetFavouriteListModelToJson(
  GetFavouriteListModel instance,
) => <String, dynamic>{
  'data': instance.data?.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'message': instance.message,
};

FavouriteDatumModel _$FavouriteDatumModelFromJson(Map<String, dynamic> json) =>
    FavouriteDatumModel()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..image = json['image'] as String?
      ..numberOfItems = (json['number_of_items'] as num?)?.toInt();

Map<String, dynamic> _$FavouriteDatumModelToJson(
  FavouriteDatumModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
  'number_of_items': instance.numberOfItems,
};
