class CancelSessionTojson {
  final int sessionId;
  final List<int> reasonsIds;

  CancelSessionTojson({required this.sessionId, required this.reasonsIds});
  Map<String, dynamic> tojson() => {
    "meeting_session_id": sessionId,
    "reason_to_cancel_session_ids": reasonsIds,
  };
}
