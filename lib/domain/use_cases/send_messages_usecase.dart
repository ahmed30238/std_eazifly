import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/chat_model/send_messages_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/chat/send_messages_entities.dart';

class SendMessagesUsecase
    extends BaseUsecase<SendMessagesEntities, SendMessagesParameters> {
  final BaseRepository baseRepository;

  SendMessagesUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, SendMessagesEntities>> call({
    required SendMessagesParameters parameter,
  }) async {
    return await baseRepository.sendMessages(data: parameter.data);
  }
}

class SendMessagesParameters {
  final SendMessagesTojson data;

  SendMessagesParameters({required this.data});
}
