import 'package:eazifly_student/domain/entities/my_programs/get_user_feedbacks_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_feedbacks_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUserFeedbacksModel extends GetUserFeedbacksEntity {
  GetUserFeedbacksModel();

  factory GetUserFeedbacksModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserFeedbacksModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserFeedbacksModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserFeedbackModel extends UserFeedbackEntity {
  UserFeedbackModel();

  factory UserFeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$UserFeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserFeedbackModelToJson(this);
}
