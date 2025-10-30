import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/library/library_order_and_subscribe_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/library_order_and_subscription_entity.dart';

class LibraryOrderAndSubscriptionUsecase
    extends
        BaseUsecase<
          LibraryOrderAndSubscriptionEntity,
          LibraryOrderAndSubscriptionParameters
        > {
  final BaseRepository baseRepository;

  LibraryOrderAndSubscriptionUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, LibraryOrderAndSubscriptionEntity>> call({
    required LibraryOrderAndSubscriptionParameters parameter,
  }) async {
    return await baseRepository.libraryOrderAndSubscribe(data: parameter.data);
  }
}

class LibraryOrderAndSubscriptionParameters {
  final LibraryOrderAndSubscribeTojson data;

  LibraryOrderAndSubscriptionParameters({required this.data});
}
