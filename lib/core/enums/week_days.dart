enum WeekDaysEnum {
  saturday,
  sunday,
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
}

extension WeekDaysEnumExtension on WeekDaysEnum {
  String get requestValue {
    return switch (this) {
      WeekDaysEnum.saturday => 'Saturday',
      WeekDaysEnum.sunday => 'Sunday',
      WeekDaysEnum.monday => 'Monday',
      WeekDaysEnum.tuesday => 'Tuesday',
      WeekDaysEnum.wednesday => 'Wednesday',
      WeekDaysEnum.thursday => 'Thursday',
      WeekDaysEnum.friday => 'Friday'
    };
  }

  String get title {
    return switch (this) {
      WeekDaysEnum.saturday => 'السبت',
      WeekDaysEnum.sunday => 'الأحد',
      WeekDaysEnum.monday => 'الإثنين',
      WeekDaysEnum.tuesday => 'الثلاثاء',
      WeekDaysEnum.wednesday => 'الأربعاء',
      WeekDaysEnum.thursday => 'الخميس',
      WeekDaysEnum.friday => 'الجمعة'
    };
  }
}
