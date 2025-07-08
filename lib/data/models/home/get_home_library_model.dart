import 'package:eazifly_student/domain/entities/home/get_home_library_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_home_library_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetHomeLibraryModel extends GetHomeLibraryEntity {
  GetHomeLibraryModel();

  factory GetHomeLibraryModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeLibraryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeLibraryModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeLibraryDatumModel extends GetHomeLibraryDatumEntity {
  GetHomeLibraryDatumModel();

  factory GetHomeLibraryDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeLibraryDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeLibraryDatumModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeLibraryItemsModel extends GetHomeLibraryItemsEntity {
  GetHomeLibraryItemsModel();

  factory GetHomeLibraryItemsModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeLibraryItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeLibraryItemsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeLibraryItemsDatumModel extends GetHomeLibraryItemsDatumEntity {
  GetHomeLibraryItemsDatumModel();

  factory GetHomeLibraryItemsDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeLibraryItemsDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeLibraryItemsDatumModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeLibraryMetaModel extends GetHomeLibraryMetaEntity {
  GetHomeLibraryMetaModel();

  factory GetHomeLibraryMetaModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeLibraryMetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeLibraryMetaModelToJson(this);
}
