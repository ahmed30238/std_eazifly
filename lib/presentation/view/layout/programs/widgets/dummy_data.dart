import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class TeacherProgramDetailsModel {
  final String title;
  final String subTitle;
  final String icon;

  TeacherProgramDetailsModel({
    required this.title,
    required this.subTitle,
    required this.icon,
  });
}

var teacherProgramDetailsList = [
  TeacherProgramDetailsModel(
    title: "عدد الطلاب",
    subTitle: "50 طالب",
    icon: MyImages.iconsPeople,
  ),
  TeacherProgramDetailsModel(
    title: "سعر الساعة ",
    subTitle: "1200 ج.م",
    icon: MyImages.iconsCash,
  ),
  TeacherProgramDetailsModel(
    title: "تاريخ البدء",
    subTitle: "subTitle",
    icon: MyImages.iconsCoin,
  ),
];
