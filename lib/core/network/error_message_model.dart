class ErrorMessageModel {
  final String statusMessage;

  ErrorMessageModel({required this.statusMessage});

  factory ErrorMessageModel.fromjson(dynamic json) {
    if (json is String) {
      return ErrorMessageModel(statusMessage: json);
    }

    if (json is Map<String, dynamic>) {
      final msg = _extractMessage(json);
      return ErrorMessageModel(statusMessage: msg);
    }

    return ErrorMessageModel(statusMessage: 'حدث خطأ غير متوقع');
  }

  static String _extractMessage(Map<String, dynamic> json) {
    if (json.containsKey('questions')) {
      final questions = json['questions'];
      if (questions is List && questions.isNotEmpty) {
        return questions.first.toString();
      }
    }

    if (json.containsKey('message')) {
      final message = json['message'];
      if (message is String) return message;

      // الرسالة نفسها عبارة عن ماب فيها تفاصيل
      if (message is Map<String, dynamic>) {
        return _extractMessage(message); // recursive
      }
    }

    return 'حدث خطأ غير متوقع';
  }
}
