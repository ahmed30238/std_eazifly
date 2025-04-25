import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';
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
List<String> paths = [
  RoutePaths.lectureView,
  RoutePaths.assignments,
  RoutePaths.quizzes,
  RoutePaths.meetings,
];
List<String> images = [
  // MyImages.imagesEditedPersona,
  MyImages.imagesPersona,
  // MyImages.imagesPngImage,
  // MyImages.imagesPngPersona,
];

List<String> iconsList = [
  MyImages.iconsLiveBroadcasting,
  MyImages.iconsAssignments,
  MyImages.iconsQuizzes,
  MyImages.iconsMeetings,
];
List<String> lecturetextList = [
  "موعد المحاضرة",
  "مدة المحاضرة",
  "الطلاب",
];
