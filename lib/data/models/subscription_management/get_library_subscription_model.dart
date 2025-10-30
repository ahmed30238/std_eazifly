import 'package:eazifly_student/domain/entities/subscription_management/get_library_subscription_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_library_subscription_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetLibrarySubscriptionModel extends GetLibrarySubscriptionEntity {
  GetLibrarySubscriptionModel();

  factory GetLibrarySubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$GetLibrarySubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetLibrarySubscriptionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetLibrarySubscriptionDataModel extends GetLibrarySubscriptionDataEntity {
  GetLibrarySubscriptionDataModel();

  factory GetLibrarySubscriptionDataModel.fromJson(Map<String, dynamic> json) =>
      _$GetLibrarySubscriptionDataModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetLibrarySubscriptionDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetLibrarySubscriptionPlanModel extends GetLibrarySubscriptionPlanEntity {
  GetLibrarySubscriptionPlanModel();

  factory GetLibrarySubscriptionPlanModel.fromJson(Map<String, dynamic> json) =>
      _$GetLibrarySubscriptionPlanModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetLibrarySubscriptionPlanModelToJson(this);
}
