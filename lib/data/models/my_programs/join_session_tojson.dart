class JoinSessionTojson {
  final String status;
  final int meetingSessionId;

  JoinSessionTojson({required this.status, required this.meetingSessionId});
  Map<String, dynamic> toJson() => {
    'status': status,
    'meeting_session_id': meetingSessionId,
  };
}
