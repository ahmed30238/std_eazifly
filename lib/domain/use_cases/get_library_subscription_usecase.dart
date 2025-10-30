import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/subscription_management/get_library_subscription_entity.dart';

class GetLibrarySubscriptionUsecase
    extends BaseUsecase<GetLibrarySubscriptionEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetLibrarySubscriptionUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetLibrarySubscriptionEntity>> call({
    NoParameter? parameter,
  }) async {
    return await baseRepository.getLibrarySubscription();
  }
}
