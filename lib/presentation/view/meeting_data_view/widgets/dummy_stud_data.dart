import 'package:flutter/material.dart';

class StudentStatsData {
  final String evaluationTitle;
  final String percentage;

  StudentStatsData({required this.evaluationTitle, required this.percentage});
}

List<StudentStatsData> dataList(BuildContext context) {
  List<StudentStatsData> dataList = [
    StudentStatsData(
      evaluationTitle: "موعد اللقاء",
      percentage: "2025-5-15",
    ),
    StudentStatsData(
      evaluationTitle: "وقت اللقاء",
      percentage: "12:45 PM",
    ),
    StudentStatsData(
      evaluationTitle: "مدة اللقاء",
      percentage: "45 دقيقة"
    ),
  ];
  return dataList;
}
