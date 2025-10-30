import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/children_entities/get_my_children_entity.dart';

class GetChildrenUsecase
    extends BaseUsecase<GetMyChildrenEntity, GetMyChildernParameters> {
  final BaseRepository baseRepository;

  GetChildrenUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetMyChildrenEntity>> call({
    required GetMyChildernParameters parameter,
  }) async {
    return await baseRepository.getMyChildren(
      childrensStatus: parameter.childernsStatus,
    );
  }
}

class GetMyChildernParameters {
  final bool childernsStatus;

  GetMyChildernParameters({required this.childernsStatus});
}
