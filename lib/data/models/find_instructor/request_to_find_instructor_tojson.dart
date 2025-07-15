class RequestToFindInstructorTojson {
  final String startTime;
  final String endTime;
  final String contentId;
  final String programId;
  final String day;

  RequestToFindInstructorTojson({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.contentId,
    required this.programId,
  });
  Map<String, dynamic> toJson() {
    return {
      'program_id': programId,
      'content_id': contentId,
      'end_time': endTime,
      'start_time': startTime,
      'day': day,
    };
  }
}
/*
program_id,
content_id,
end_time,
start_time,
day,
 */
