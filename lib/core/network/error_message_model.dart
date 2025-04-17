class ErrorMessageModel {
  final String statusMessage;
  final int statusCode;
  final bool success;

  ErrorMessageModel({
    required this.statusMessage,
    required this.statusCode,
    required this.success,
  });

  factory ErrorMessageModel.fromjson(Map<String, dynamic> json) =>
      ErrorMessageModel(
        statusMessage: json["status_message"],
        statusCode: json["status_code"],
        success: json["success"],
      );
}
