import 'package:eazifly_student/domain/entities/change_instructor/get_user_subscription_data_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_user_subscription_data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetUserSubscriptionDataModel extends GetUserSubscriptionDataEntity {
  GetUserSubscriptionDataModel();

  factory GetUserSubscriptionDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserSubscriptionDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserSubscriptionDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserSubscriptionDataDataModel extends GetUserSubscriptionDataDataEntity {
  GetUserSubscriptionDataDataModel();

  factory GetUserSubscriptionDataDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserSubscriptionDataDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserSubscriptionDataDataModelToJson(this);
}
