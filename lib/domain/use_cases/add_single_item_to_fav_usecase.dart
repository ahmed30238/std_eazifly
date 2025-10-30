import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/library/favourite_list/add_single_item_to_fav_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/add_single_item_to_fav_list_entity.dart';

class AddSingleItemToFavUsecase
    extends
        BaseUsecase<
          AddSingleItemToFavListEntity,
          AddSingleItemToFavListParameters
        > {
  final BaseRepository baseRepository;

  AddSingleItemToFavUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, AddSingleItemToFavListEntity>> call({
    required AddSingleItemToFavListParameters parameter,
  }) async {
    return await baseRepository.addSingleItemToFavList(data: parameter.data);
  }
}

class AddSingleItemToFavListParameters {
  final AddSingleItemToFavListTojson data;

  AddSingleItemToFavListParameters({required this.data});
}
