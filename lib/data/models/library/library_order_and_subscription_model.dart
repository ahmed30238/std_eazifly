import 'package:eazifly_student/domain/entities/library_order_and_subscription_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'library_order_and_subscription_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LibraryOrderAndSubscriptionModel
    extends LibraryOrderAndSubscriptionEntity {
  LibraryOrderAndSubscriptionModel();

  factory LibraryOrderAndSubscriptionModel.fromJson(
    Map<String, dynamic> json,
  ) => _$LibraryOrderAndSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LibraryOrderAndSubscriptionModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LibraryOrderDataModel extends LibraryOrderDataEntity {
  LibraryOrderDataModel();

  factory LibraryOrderDataModel.fromJson(Map<String, dynamic> json) =>
      _$LibraryOrderDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$LibraryOrderDataModelToJson(this);
}
