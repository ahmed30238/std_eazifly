import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:flutter/material.dart';

List<String> textList(BuildContext context) {
  var lang = context.loc!;
  List<String> textList = [
    lang.currentLecture,
    lang.assignments,
    lang.quizzes,
    lang.meetings,
  ];
  return textList;
}

List<String> iconsList = [
  MyImages.iconsLiveBroadcasting,
  MyImages.iconsProfile,
  MyImages.iconsBriefcase,
  MyImages.iconsProfile,
];
List<String> lecturetextList = [
  "موعد المحاضرة",
  "مدة المحاضرة",
  "الطلاب",
];
