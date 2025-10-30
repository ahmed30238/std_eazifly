enum GenderEnum { male, female }

extension GenderText on GenderEnum {
  String get title {
    return switch (this) {
      GenderEnum.male => 'ذكر',
      GenderEnum.female => 'انثي',
    };
  }

  String get requestValue {
    return switch (this) {
      GenderEnum.male => 'male',
      GenderEnum.female => 'female',
    };
  }
}
