import 'package:eazifly_student/data/models/library/get_library_categories_model.dart';
import 'package:eazifly_student/domain/entities/get_all_library_lists_entity.dart';
import 'package:eazifly_student/domain/entities/get_library_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_library_lists_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetAllLibraryListsModel extends GetAllLibraryListsEntity {
  GetAllLibraryListsModel();

  factory GetAllLibraryListsModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllLibraryListsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllLibraryListsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LibraryListDatumModel extends LibraryListElementEntity {
  LibraryListDatumModel();

  factory LibraryListDatumModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryListDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryListDatumModelToJson(this);
}
