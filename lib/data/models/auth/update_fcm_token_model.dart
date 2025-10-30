import 'package:eazifly_student/domain/entities/update_fcm_token_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'update_fcm_token_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UpdateFcmTokenModel extends UpdateFcmTokenEntity {
  UpdateFcmTokenModel();

  factory UpdateFcmTokenModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFcmTokenModelToJson(this);
}
