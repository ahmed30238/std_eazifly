import 'package:eazifly_student/presentation/view/lecture/widgets/dummy_data.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LectureStats extends StatelessWidget {
  final double? horizontalPadding;
  final List<String>? titleText;
  final List<String>? subtitleText; // البيانات الفعلية من السيرفر
  final LectureStatesEnum state;
  final bool? reJoin;
  final VoidCallback? onRejoinTap;
  final String? timeDiff; // الوقت المتبقي أو المنقضي
  final String? nextLecture; // موعد المحاضرة التالية
  final String? duration; // مدة المحاضرة

  const LectureStats({
    super.key,
    this.horizontalPadding,
    this.onRejoinTap,
    required this.state,
    this.titleText,
    this.subtitleText,
    this.reJoin = false,
    this.timeDiff,
    this.nextLecture,
    this.duration,
  });

  // دالة لتنسيق عرض الوقت المتبقي
  String formatTimeDifference(String? timeDiffString) {
    if (timeDiffString == null || timeDiffString.isEmpty) {
      return "غير محدد";
    }

    // إذا كانت البيانات منسقة مسبقاً، أرجعها كما هي
    if (timeDiffString.contains("بعد") ||
        timeDiffString.contains("منذ") ||
        timeDiffString.contains("انتهت") ||
        timeDiffString.contains("/")) {
      return timeDiffString;
    }

    try {
      // محاولة تحويل Duration string إلى format مقروء
      Duration? duration = _parseDuration(timeDiffString);
      if (duration == null) return timeDiffString;

      return formatDuration(duration);
    } catch (e) {
      return timeDiffString;
    }
  }

  Duration? _parseDuration(String durationString) {
    // تحليل duration string مثل "1:30:00" أو "0:45:30"
    try {
      List<String> parts = durationString.split(':');
      if (parts.length >= 3) {
        int hours = int.parse(parts[0]);
        int minutes = int.parse(parts[1]);
        int seconds = int.parse(parts[2]);
        return Duration(hours: hours, minutes: minutes, seconds: seconds);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  List<String> getSubtitles() {
    if (subtitleText != null && subtitleText!.length >= 3) {
      return subtitleText!;
    }

    // إنشاء قائمة بناءً على البيانات المتاحة
    return [
      nextLecture ?? lectureStatsSubTitles[0],
      duration ?? lectureStatsSubTitles[1],
      formatTimeDifference(
          timeDiff), // هذا سيتم التعامل معه بشكل خاص في index 2
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<String> subtitles = getSubtitles();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: index == 1 ? 8.w : 0),
            child: Container(
              height: 80.h,
              width: 108.w,
              decoration: BoxDecoration(
                borderRadius: 10.cr,
                color: MainColors.veryLightGrayFormField,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    titleText?[index] ?? lectureStatsTitle[index],
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  if (index == 2) ...{
                    if (reJoin == true) ...{
                      InkWell(
                        onTap: onRejoinTap,
                        child: TextedContainer(
                          text: "اعادة دخول",
                          containerColor: MainColors.lightblue,
                          width: 88.w,
                          height: 26.h,
                          textColor: MainColors.blueTextColor,
                        ),
                      )
                    } else ...{
                      LectureStates(
                        state: state,
                        customText: formatTimeDifference(timeDiff),
                      )
                    },
                  } else ...{
                    Text(
                      subtitles[index],
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 14,
                        color: MainColors.blackText,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum LectureStatesEnum {
  finished, // انتهت
  ongoing, // جارية الآن
  dated, // مجدولة (لم تبدأ بعد)
  pending, // في انتظار (يمكن استخدامها بدلاً من dated)
}

class LectureStates extends StatelessWidget {
  final LectureStatesEnum state;
  final String? customText; // نص مخصص للعرض

  const LectureStates({
    super.key,
    required this.state,
    this.customText,
  });

  String getStateText() {
    if (customText != null && customText!.isNotEmpty) {
      return customText!;
    }

    switch (state) {
      case LectureStatesEnum.ongoing:
        return "جارية الآن";
      case LectureStatesEnum.dated:
        return "مجدولة";
      case LectureStatesEnum.finished:
        return "انتهت";
      case LectureStatesEnum.pending:
        return "قادمة";
      default:
        return "غير محدد";
    }
  }

  Color getContainerColor() {
    switch (state) {
      case LectureStatesEnum.ongoing:
        return MainColors.lightgreenColor;
      case LectureStatesEnum.dated:
        return MainColors.lightblue;
      case LectureStatesEnum.finished:
        return MainColors.lightRed;
      default:
        return MainColors.lightRed;
    }
  }

  Color getTextColor() {
    switch (state) {
      case LectureStatesEnum.ongoing:
        return MainColors.greenTeal;
      case LectureStatesEnum.dated:
        return MainColors.blueTextColor;
      case LectureStatesEnum.finished:
        return MainColors.red;
      default:
        return MainColors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextedContainer(
      text: getStateText(),
      height: 28.h,
      width: 83.w,
      fontSize: 12,
      radius: 16.r,
      containerColor: getContainerColor(),
      textColor: getTextColor(),
    );
  }
}
