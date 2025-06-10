import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/get_list_items_using_list_id_entity.dart';

class GetListItemsUsingListIdUsecase extends BaseUsecase<
    GetListItemsUsingListIdEntity, GetListItemsUsingListIdParameters> {
  final BaseRepository baseRepository;

  GetListItemsUsingListIdUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, GetListItemsUsingListIdEntity>> call(
      {required GetListItemsUsingListIdParameters parameter}) async {
    return await baseRepository.getListItemsUsingListId(
        listId: parameter.listId);
  }
}

class GetListItemsUsingListIdParameters {
  final int listId;

  GetListItemsUsingListIdParameters({required this.listId});
}
