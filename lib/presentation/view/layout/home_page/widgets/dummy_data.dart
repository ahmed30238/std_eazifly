import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

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
  RoutePaths.currentSession,
  RoutePaths.assignments,
  RoutePaths.quizzes,
  RoutePaths.meetings,
];
List<String> images = [
  // MyImages.imagesEditedPersona,
  Assets.imagesPersona,
  // MyImages.imagesPngImage,
  // MyImages.imagesPngPersona,
];

List<String> iconsList = [
  Assets.iconsLiveBroadcasting,
  Assets.iconsAssignments,
  Assets.iconsQuizzes,
  Assets.iconsMeetings,
];
List<String> lecturetextList = [
  "موعد المحاضرة",
  "مدة المحاضرة",
  "الطلاب",
];
