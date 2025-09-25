import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import '../../../domain/entities/user/add_user_session_date_and_time_entity.dart';
part 'add_user_session_date_and_time_model.g.dart';

AddUserSessionDateAndTimeModel addUserSessionDateAndTimeModelFromJson(String str) =>
    AddUserSessionDateAndTimeModel.fromJson(json.decode(str));

String addUserSessionDateAndTimeModelToJson(AddUserSessionDateAndTimeModel data) =>
    json.encode(data.toJson());

@JsonSerializable(explicitToJson: true)
class AddUserSessionDateAndTimeModel extends AddUserSessionDateAndTimeEntity {
  AddUserSessionDateAndTimeModel();

  factory AddUserSessionDateAndTimeModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserSessionDateAndTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddUserSessionDateAndTimeModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddUserSessionDateAndTimeDatumModel extends AddUserSessionDateAndTimeDatumEntity {
  AddUserSessionDateAndTimeDatumModel();

  factory AddUserSessionDateAndTimeDatumModel.fromJson(Map<String, dynamic> json) => _$AddUserSessionDateAndTimeDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddUserSessionDateAndTimeDatumModelToJson(this);
}