import 'package:eazifly_student/domain/entities/user/update_profile_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateProfileModel extends UpdateProfileEntity {
  UpdateProfileModel();

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileDataModel extends UpdateProfileDataEntity {
  UpdateProfileDataModel();

  factory UpdateProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileProgramModel extends UpdateProfileProgramEntity {
  UpdateProfileProgramModel();

  factory UpdateProfileProgramModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileProgramModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileProgramModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileStatusLabelModel extends UpdateProfileStatusLabelEntity {
  UpdateProfileStatusLabelModel();

  factory UpdateProfileStatusLabelModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileStatusLabelModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileStatusLabelModelToJson(this);
}
