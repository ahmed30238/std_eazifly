import 'package:eazifly_student/core/network/error_message_model.dart';

class ServerException implements Exception {
  ErrorMessageModel errorMessageModel;
  ServerException({
    required this.errorMessageModel,
  });
}
class LocalDbException implements Exception {
  final String message;
  LocalDbException({
    required this.message,
  });
}
