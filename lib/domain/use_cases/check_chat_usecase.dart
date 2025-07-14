import 'package:dartz/dartz.dart';
import 'package:eazifly_student/core/base_usecase/base_usecase.dart';
import 'package:eazifly_student/core/general_failure/failure.dart';
import 'package:eazifly_student/data/models/chat_model/check_chat_tojson.dart';
import 'package:eazifly_student/domain/base_repo/repo.dart';
import 'package:eazifly_student/domain/entities/chat/check_chat_entity.dart';

class CheckChatUsecase extends BaseUsecase<CheckChatEntity,
    CheckChatParameters> {
  final BaseRepository baseRepository;

  CheckChatUsecase({required this.baseRepository});

  @override
  Future<Either<Failure, CheckChatEntity>> call(
      {required CheckChatParameters parameter}) async {
    return await baseRepository.checkChat(data: parameter.data);
  }
}

class CheckChatParameters {
  final CheckChatTojson data;

  CheckChatParameters({required this.data});
}
