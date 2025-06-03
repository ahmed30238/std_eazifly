import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/library/favourite_list/store_favourite_list_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/store_favourite_list_entity.dart';

class StoreFavouriteListUsecase extends BaseUsecase<StoreFavouriteListEntity,
    StoreFavouriteDataParameters> {
  final BaseRepository baseRepository;

  StoreFavouriteListUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, StoreFavouriteListEntity>> call(
      {required StoreFavouriteDataParameters parameter}) async {
    return await baseRepository.storeFavouriteList(data: parameter.data);
  }
}

class StoreFavouriteDataParameters {
  final StoreFavouriteListTojson data;

  StoreFavouriteDataParameters({required this.data});
}
