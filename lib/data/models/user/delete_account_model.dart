import 'package:eazifly_student/domain/entities/user/delete_account_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'delete_account_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DeleteAccountModel extends DeleteAccountEntity {
  DeleteAccountModel();

  factory DeleteAccountModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteAccountModelToJson(this);
}
