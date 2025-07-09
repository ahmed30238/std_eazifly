import 'package:eazifly_student/domain/entities/home/get_home_quizzes_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_home_quizzes_model.g.dart';

@JsonSerializable(explicitToJson: true)
class GetHomeQuizzesModel extends GetHomeQuizzesEntity {
  GetHomeQuizzesModel();

  factory GetHomeQuizzesModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeQuizzesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeQuizzesModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetHomeQuizzesDatumModel extends GetHomeQuizzesDatumEntity {
  GetHomeQuizzesDatumModel();

  factory GetHomeQuizzesDatumModel.fromJson(Map<String, dynamic> json) =>
      _$GetHomeQuizzesDatumModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetHomeQuizzesDatumModelToJson(this);
}
