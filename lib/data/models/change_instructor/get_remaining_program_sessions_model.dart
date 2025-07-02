import 'package:eazifly_student/domain/entities/change_instructor/get_remaining_program_sessions_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_remaining_program_sessions_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetRemainingProgramSessionsModel extends GetRemainingProgramSessionsEntity {
  GetRemainingProgramSessionsModel();

  factory GetRemainingProgramSessionsModel.fromJson(Map<String, dynamic> json) =>
      _$GetRemainingProgramSessionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetRemainingProgramSessionsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRemainigProgramSessionsDatumModel extends GetRemainigProgramSessionsDatumEntity {
  GetRemainigProgramSessionsDatumModel() ;

  factory GetRemainigProgramSessionsDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetRemainigProgramSessionsDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetRemainigProgramSessionsDatumModelToJson(this);
}
