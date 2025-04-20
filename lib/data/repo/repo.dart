

import 'package:eazifly_student/data/data_source/remote_data_source.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';

class Repository extends BaseRepository {
  BaseRemoteDataSource baseRemoteDataSource;
  Repository({
    required this.baseRemoteDataSource,
  });
  // @override
  // Future<Either<Failure, LoginModel>> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   final result = await baseRemoteDataSource.login(email, password);
  //   try {
  //     return Right(result);
  //   } on ServerException catch (e) {
  //     return Left(ServerFailure(message: e.errorMessageModel.statusMessage));
  //   }
  // }
}
