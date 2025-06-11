import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_my_children_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetMyChildrenModel extends GetMyChildrenEntity {
  GetMyChildrenModel();

  factory GetMyChildrenModel.fromJson(Map<String, dynamic> json) =>
      _$GetMyChildrenModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyChildrenModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MyChildModel extends MyChildEntity {
  MyChildModel();

  factory MyChildModel.fromJson(Map<String, dynamic> json) =>
      _$MyChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyChildModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChildrenStatusLabelModel extends StatusLabelEntity {
  ChildrenStatusLabelModel();

  factory ChildrenStatusLabelModel.fromJson(Map<String, dynamic> json) =>
      _$ChildrenStatusLabelModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChildrenStatusLabelModelToJson(this);
}
