import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_favourite_list_items_using_list_id_entity.dart';

class GetFavouriteListItemUsingListIdUsecase extends BaseUsecase<
    GetFavouriteListItemsUsingListIdEntity,
    GetFavouriteListItemUsingListIdParameters> {
  final BaseRepository baseRepository;

  GetFavouriteListItemUsingListIdUsecase({required this.baseRepository});
  @override
  Future<Either<Failure, GetFavouriteListItemsUsingListIdEntity>> call(
      {required GetFavouriteListItemUsingListIdParameters parameter}) async {
    return await baseRepository.getFavouriteListItemsUsinListId(
        listId: parameter.listId);
  }
}

class GetFavouriteListItemUsingListIdParameters {
  final int listId;

  GetFavouriteListItemUsingListIdParameters({required this.listId});
}
