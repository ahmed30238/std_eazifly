import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/chat/get_my_chats_entity.dart';

class GetMyChatsUsecase
    extends BaseUsecase<GetMyChatsEntity, GetMyChatsParameters> {
  final BaseRepository baseRepository;

  GetMyChatsUsecase({required this.baseRepository});
  @override
  Future<Either<Failure, GetMyChatsEntity>> call({
    required GetMyChatsParameters parameter,
  }) async {
    return await baseRepository.getMyChats(type: parameter.type);
  }
}

class GetMyChatsParameters {
  final String type;

  GetMyChatsParameters({required this.type});
}
