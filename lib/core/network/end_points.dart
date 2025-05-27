class EndPoints {
  EndPoints._();
  static const login = "login";
  static const getPrograms = "programs";
  static String getProgramDetails({required int programId}) => "program/details/$programId";
}
