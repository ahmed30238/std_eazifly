class ChangeSessionStatusToJson {
  final int sessionId;
  final String status;

  ChangeSessionStatusToJson({required this.sessionId, required this.status});
  Map<String, dynamic> toJson() {
    return {'session_id': sessionId, 'status': status};
  }
}
