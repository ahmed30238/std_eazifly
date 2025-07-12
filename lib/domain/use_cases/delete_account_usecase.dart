import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/user/delete_account_entity.dart';

class DeleteAccountUsecase
    extends BaseUsecase<DeleteAccountEntity, DeleteAccountParameters> {
  final BaseRepository baseRepository;

  DeleteAccountUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, DeleteAccountEntity>> call(
      {required DeleteAccountParameters parameter}) async {
    return await baseRepository.deleteAccount(userId: parameter.userId);
  }
}

class DeleteAccountParameters {
  final int userId;

  DeleteAccountParameters({required this.userId});
}
