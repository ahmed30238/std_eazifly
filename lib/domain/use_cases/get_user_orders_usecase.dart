import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_user_orders_entities.dart';

class GetUserOrdersUsecase
    extends BaseUsecase<GetUserOrdersEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetUserOrdersUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetUserOrdersEntity>> call(
      {required NoParameter parameter}) async {
    return await baseRepository.getUserOrders();
  }
}
