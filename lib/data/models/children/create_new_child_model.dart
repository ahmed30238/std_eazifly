import 'package:eazifly_student/data/models/children/get_my_children_model.dart';
import 'package:eazifly_student/domain/entities/children_entities/create_new_child_entity.dart';
import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_new_child_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateNewChildModel extends CreateNewChildEntity {
  CreateNewChildModel();

  factory CreateNewChildModel.fromJson(Map<String, dynamic> json) =>
      _$CreateNewChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateNewChildModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewChildModel extends MyChildEntity {
  NewChildModel();

  factory NewChildModel.fromJson(Map<String, dynamic> json) =>
      _$NewChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewChildModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class StatusLabelModel extends StatusLabelEntity {
  StatusLabelModel();

  factory StatusLabelModel.fromJson(Map<String, dynamic> json) =>
      _$StatusLabelModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatusLabelModelToJson(this);
}
