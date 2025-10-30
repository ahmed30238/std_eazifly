import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/create_order_entities.dart';

class CreateOrderUsecase
    extends BaseUsecase<CreateOrderEntity, CreateOrderParameters> {
  final BaseRepository baseRepository;

  CreateOrderUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, CreateOrderEntity>> call({
    required CreateOrderParameters parameter,
  }) async {
    return await baseRepository.createOrder(data: parameter.data);
  }
}

class CreateOrderParameters {
  final CreateOrderTojson data;

  CreateOrderParameters({required this.data});
}
