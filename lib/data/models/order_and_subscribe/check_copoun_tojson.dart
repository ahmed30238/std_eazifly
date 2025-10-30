class CheckCopounTojson {
  final String code;

  CheckCopounTojson({required this.code});
  Map<String, dynamic> toJson() => {"code": code};
}
