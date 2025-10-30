import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_all_items_entity.dart';

class GetAllItemsUsecase extends BaseUsecase<GetAllItemsEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetAllItemsUsecase({required this.baseRepository});
  @override
  Future<Either<Failure, GetAllItemsEntity>> call({
    required NoParameter parameter,
  }) async {
    return await baseRepository.getAllItems();
  }
}
