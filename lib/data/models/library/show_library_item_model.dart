import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';
import 'package:eazifly_student/domain/entities/show_library_item_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'show_library_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowLibraryItemModel extends ShowLibraryItemEntity {
  ShowLibraryItemModel();

  factory ShowLibraryItemModel.fromJson(Map<String, dynamic> json) =>
      _$ShowLibraryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowLibraryItemModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LibraryItemModel extends ItemEntity {
  LibraryItemModel();

  factory LibraryItemModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryItemModelToJson(this);
}
