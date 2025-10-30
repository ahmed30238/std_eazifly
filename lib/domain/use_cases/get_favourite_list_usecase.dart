import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_entity.dart';

class GetFavouriteListUsecase
    extends BaseUsecase<GetFavouriteListEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetFavouriteListUsecase({required this.baseRepository});
  @override
  Future<Either<Failure, GetFavouriteListEntity>> call({
    required NoParameter parameter,
  }) async {
    return await baseRepository.getFavouriteList();
  }
}
