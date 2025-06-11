import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/children/create_new_child_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/children_entities/create_new_child_entity.dart';

class CreateNewChildUsecase
    extends BaseUsecase<CreateNewChildEntity, CreateNewChildParameters> {
  final BaseRepository baseRepository;

  CreateNewChildUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, CreateNewChildEntity>> call(
      {required CreateNewChildParameters parameter}) async {
    return await baseRepository.createNewChild(data: parameter.data);
  }
}

class CreateNewChildParameters {
  final CreateNewChildTojson data;

  CreateNewChildParameters({required this.data});
}
