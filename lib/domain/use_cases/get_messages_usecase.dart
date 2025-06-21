import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/chat/get_messages_entities.dart';


class GetMessagesUsecase
    extends BaseUsecase<GetMessagesEntities, GetMessagesParameters> {
  final BaseRepository baseRepository;

  GetMessagesUsecase({required this.baseRepository});
  @override
  Future<Either<Failure, GetMessagesEntities>> call(
      {required GetMessagesParameters parameter}) async {
    return await baseRepository.getMessages(
      chatId: parameter.chatId,
      offset: parameter.offset,
 
    );
  }
}

class GetMessagesParameters {
  final int offset;
  final int chatId;

  GetMessagesParameters({
    required this.offset,
    required this.chatId,
  });
}
