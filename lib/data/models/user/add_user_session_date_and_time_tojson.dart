class AddUserSessionDateAndTimeToJson {
  final int programId;
  final int instructorId;
  final List<Times> times;

  AddUserSessionDateAndTimeToJson({
    required this.programId,
    required this.instructorId,
    required this.times,
  });

  Map<String, dynamic> toJson() => {
    "program_id": programId,
    "instructor_id": instructorId,
    "times": times
        .map((e) => {"day": e.day, "from": e.from, "to": e.to})
        .toList(),
  };
}

class Times {
  final String day;
  final String from;
  final String to;

  Times({required this.day, required this.from, required this.to});
}
