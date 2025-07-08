import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/home/get_home_library_entity.dart';

class GetHomeLibraryUsecase
    extends BaseUsecase<GetHomeLibraryEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetHomeLibraryUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetHomeLibraryEntity>> call(
      {required NoParameter parameter}) async {
    return await baseRepository.getHomeLibrary();
  }
}
