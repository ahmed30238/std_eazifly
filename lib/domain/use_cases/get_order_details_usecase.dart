import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_order_details_entity.dart';

class GetOrderDetailsUsecase
    extends BaseUsecase<GetOrderDetailsEntity, GetOrderDetailsPaameters> {
  final BaseRepository baseRepository;

  GetOrderDetailsUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetOrderDetailsEntity>> call(
      {required GetOrderDetailsPaameters parameter}) async {
    return baseRepository.getOrderDetails(orderId: parameter.orderId);
  }
}

class GetOrderDetailsPaameters {
  final int orderId;

  GetOrderDetailsPaameters({required this.orderId});
}
