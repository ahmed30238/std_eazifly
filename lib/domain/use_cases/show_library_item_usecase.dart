import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/show_library_item_entity.dart';

class ShowLibraryItemUsecase
    extends BaseUsecase<ShowLibraryItemEntity, ShowLibraryItemParameters> {
  final BaseRepository baseRepository;

  ShowLibraryItemUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, ShowLibraryItemEntity>> call({
    required ShowLibraryItemParameters parameter,
  }) async {
    return await baseRepository.showLibraryItem(itemId: parameter.itemId);
  }
}

class ShowLibraryItemParameters {
  final int itemId;

  ShowLibraryItemParameters({required this.itemId});
}
