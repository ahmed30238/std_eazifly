import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

var lectureStatsTitle = [
 "المحاضرة القادمة",
  "مدة المحاضرة",
  "حالة المحاضرة",
];
var lectureStatsSubTitles = [
  "12:45 PM",
  "30 دقيقة",
  "",
];

class DeliverStatusModel {
  final String text;
  final Color color;
  final Color textColor;

  DeliverStatusModel({
    required this.text,
    required this.color,
    required this.textColor,
  });
}
class BtnColors {
  final Color textColor;
  final Color containerColor;
  final String text;

  BtnColors({
    required this.textColor,
    required this.containerColor,
    required this.text,
  });
}