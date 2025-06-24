import 'package:eazifly_student/presentation/view/lecture/widgets/lecture_stats_row.dart';

class LectureStateHelper {
  /// دالة لتحديد حالة المحاضرة بناءً على وقت البداية والمدة
  static LectureStatesEnum getLectureState({
    required String? nextSession,
    required int? nextSessionDuration,
  }) {
    // إذا لم تكن هناك بيانات
    if (nextSession == null || nextSessionDuration == null) {
      return LectureStatesEnum.pending;
    }

    try {
      // تحويل nextSession إلى DateTime
      DateTime lectureStartTime = DateTime.parse(nextSession);
      DateTime now = DateTime.now();
      
      // حساب وقت انتهاء المحاضرة
      DateTime lectureEndTime = lectureStartTime.add(
        Duration(minutes: nextSessionDuration)
      );

      // تحديد الحالة
      if (now.isBefore(lectureStartTime)) {
        // المحاضرة لم تبدأ بعد
        return LectureStatesEnum.dated;
      } else if (now.isAfter(lectureStartTime) && now.isBefore(lectureEndTime)) {
        // المحاضرة جارية الآن
        return LectureStatesEnum.ongoing;
      } else {
        // المحاضرة انتهت
        return LectureStatesEnum.finished;
      }
    } catch (e) {
      // في حالة خطأ في تحليل التاريخ
      return LectureStatesEnum.pending;
    }
  }

  /// دالة لحساب الوقت المتبقي أو المنقضي
  static String getTimeDifference({
    required String? nextSession,
    required int? nextSessionDuration,
  }) {
    if (nextSession == null) {
      return "غير محدد";
    }

    try {
      DateTime lectureStartTime = DateTime.parse(nextSession);
      DateTime now = DateTime.now();
      Duration difference = lectureStartTime.difference(now);

      if (difference.isNegative) {
        // المحاضرة بدأت أو انتهت
        if (nextSessionDuration != null) {
          DateTime lectureEndTime = lectureStartTime.add(
            Duration(minutes: nextSessionDuration)
          );
          
          if (now.isBefore(lectureEndTime)) {
            // المحاضرة جارية - اعرض الوقت المتبقي لانتهائها
            Duration remainingTime = lectureEndTime.difference(now);
            return "تنتهي خلال ${_formatDuration(remainingTime)}";
          } else {
            // المحاضرة انتهت
            Duration timeSinceEnd = now.difference(lectureEndTime);
            return "انتهت منذ ${_formatDuration(timeSinceEnd)}";
          }
        } else {
          return "بدأت";
        }
      } else {
        // المحاضرة لم تبدأ بعد
        return "تبدأ خلال ${_formatDuration(difference)}";
      }
    } catch (e) {
      return "غير محدد";
    }
  }

  /// دالة مساعدة لتنسيق المدة الزمنية
  static String _formatDuration(Duration duration) {
    if (duration.inDays > 0) {
      return "${duration.inDays} ${duration.inDays == 1 ? 'يوم' : 'أيام'}";
    } else if (duration.inHours > 0) {
      return "${duration.inHours} ${duration.inHours == 1 ? 'ساعة' : 'س'}";
    } else if (duration.inMinutes > 0) {
      return "${duration.inMinutes} ${duration.inMinutes == 1 ? 'دقيقة' : 'ق'}";
    } else {
      return "${duration.inSeconds} ${duration.inSeconds == 1 ? 'ثانية' : 'ث'}";
    }
  }
}