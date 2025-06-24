import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/order_and_subscribe/create_order_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/subscription_management/upgrade_order_entity.dart';

class UpgradeOrderUsecase
    extends BaseUsecase<UpgradeOrderEntity, UpgradeOrderParameters> {
  final BaseRepository baseRepository;

  UpgradeOrderUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, UpgradeOrderEntity>> call(
      {required UpgradeOrderParameters parameter}) async {
    return await baseRepository.upgradeOrder(data: parameter.data);
  }
}

class UpgradeOrderParameters {
  final CreateOrderTojson data;

  UpgradeOrderParameters({required this.data});
}
