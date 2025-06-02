import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_all_library_lists_entity.dart';

class GetAllLibraryListsUsecase
    extends BaseUsecase<GetAllLibraryListsEntity, NoParameter> {
  final BaseRepository baseRepository;

  GetAllLibraryListsUsecase({required this.baseRepository});
  @override
  Future<Either<Failure, GetAllLibraryListsEntity>> call(
      {required NoParameter parameter}) async {
    return await baseRepository.getAllLibraryLists();
  }
}
