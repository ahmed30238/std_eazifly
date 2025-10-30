import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/like_item_entity.dart';

class LikeItemUsecase extends BaseUsecase<LikeItemEntity, LikeItemParameters> {
  final BaseRepository baseRepository;

  LikeItemUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, LikeItemEntity>> call({
    required LikeItemParameters parameter,
  }) async {
    return await baseRepository.likeItem(
      itemId: parameter.itemId,
      status: parameter.status,
    );
  }
}

class LikeItemParameters {
  final int itemId;
  final bool status;

  LikeItemParameters({required this.itemId, required this.status});
}
