import 'package:eazifly_student/domain/entities/add_note_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'add_note_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddNoteModel extends AddNoteEntity {
  AddNoteModel() : super();

  factory AddNoteModel.fromJson(Map<String, dynamic> json) =>
      _$AddNoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNoteModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddNoteDataModel extends AddNoteDataEntity {
  AddNoteDataModel() : super();

  factory AddNoteDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddNoteDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNoteDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddNoteOrderDetailModel extends AddNoteOrderDetailEntity {
  AddNoteOrderDetailModel() : super();

  factory AddNoteOrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AddNoteOrderDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNoteOrderDetailModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddNoteOrderNoteModel extends AddNoteOrderNoteEntity {
  AddNoteOrderNoteModel() : super();

  factory AddNoteOrderNoteModel.fromJson(Map<String, dynamic> json) =>
      _$AddNoteOrderNoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNoteOrderNoteModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddNoteMakerModel extends AddNoteMakerEntity {
  AddNoteMakerModel() : super();

  factory AddNoteMakerModel.fromJson(Map<String, dynamic> json) =>
      _$AddNoteMakerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNoteMakerModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddNoteStatusModel extends AddNoteStatusEntity {
  AddNoteStatusModel() : super();

  factory AddNoteStatusModel.fromJson(Map<String, dynamic> json) =>
      _$AddNoteStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNoteStatusModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddNoteUserModel extends AddNoteUserEntity {
  AddNoteUserModel() : super();

  factory AddNoteUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddNoteUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddNoteUserModelToJson(this);
}
