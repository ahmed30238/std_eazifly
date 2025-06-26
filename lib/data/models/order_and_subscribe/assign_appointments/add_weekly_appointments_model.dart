import 'package:eazifly_student/domain/entities/add_weekly_appointments_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'add_weekly_appointments_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AddWeeklyAppontmentsModel extends AddWeeklyAppontmentsEntity {
  AddWeeklyAppontmentsModel();

  factory AddWeeklyAppontmentsModel.fromJson(Map<String, dynamic> json) =>
      _$AddWeeklyAppontmentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddWeeklyAppontmentsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddWeeklyAppontmentsDatumModel extends AddWeeklyAppontmentsDatumEntity {
  AddWeeklyAppontmentsDatumModel();

  factory AddWeeklyAppontmentsDatumModel.fromJson(Map<String, dynamic> json) =>
      _$AddWeeklyAppontmentsDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddWeeklyAppontmentsDatumModelToJson(this);
}
