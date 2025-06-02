import 'package:eazifly_student/domain/entities/get_library_category_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_library_categories_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetLibraryCategoriesModel extends GetLibraryCategoriesEntity {
  GetLibraryCategoriesModel();

  factory GetLibraryCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$GetLibraryCategoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetLibraryCategoriesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LibraryCategoryDatumModel extends LibraryCategoryDatumEntity {
  LibraryCategoryDatumModel();

  factory LibraryCategoryDatumModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryCategoryDatumModelFromJson(json);
  Map<String, dynamic> toJson() => _$LibraryCategoryDatumModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LibraryListElementModel extends LibraryListElementEntity {
  LibraryListElementModel();

  factory LibraryListElementModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryListElementModelFromJson(json);
  Map<String, dynamic> toJson() => _$LibraryListElementModelToJson(this);
}
