import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_library_category_entity.dart';

class GetLibraryCategoriesUsecase extends BaseUsecase<
    GetLibraryCategoriesEntity, GetLibraryCategoriesParameters> {
  final BaseRepository baseRepository;

  GetLibraryCategoriesUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetLibraryCategoriesEntity>> call(
      {required GetLibraryCategoriesParameters parameter}) async {
    return await baseRepository.getLibraryCategories(type: parameter.type);
  }
}

class GetLibraryCategoriesParameters {
  final String? type;

  GetLibraryCategoriesParameters({this.type});
}
