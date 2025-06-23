import 'package:eazifly_student/domain/entities/subscription_management/get_program_subscription_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_program_subscription_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetProgramSubscriptionModel extends GetProgramSubscriptionEntity {
  GetProgramSubscriptionModel();

  factory GetProgramSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramSubscriptionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProgramSubscriptionDatumModel extends GetProgramSubscriptionDatumEntity {
  GetProgramSubscriptionDatumModel();

  factory GetProgramSubscriptionDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramSubscriptionDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramSubscriptionDatumModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProgramSubscriptionInstructorModel extends GetProgramSubscriptionInstructorEntity {
  GetProgramSubscriptionInstructorModel();

  factory GetProgramSubscriptionInstructorModel.fromJson(Map<String, dynamic> json) =>
      _$GetProgramSubscriptionInstructorModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetProgramSubscriptionInstructorModelToJson(this);
}
