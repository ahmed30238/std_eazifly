import 'package:eazifly_student/domain/entities/sessions/get_cancel_session_reason_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_cancel_session_reason_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetCancelSessionReasonModel extends GetCancelSessionReasonEntity {
  GetCancelSessionReasonModel();

  factory GetCancelSessionReasonModel.fromJson(Map<String, dynamic> json) =>
      _$GetCancelSessionReasonModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCancelSessionReasonModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCancelSessionReasonDatumModel
    extends GetCancelSessionReasonDatumEntity {
  GetCancelSessionReasonDatumModel();

  factory GetCancelSessionReasonDatumModel.fromJson(
          Map<String, dynamic> json) =>
      _$GetCancelSessionReasonDatumModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetCancelSessionReasonDatumModelToJson(this);
}
