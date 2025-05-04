import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class QTypeTextedContainer extends StatelessWidget {
  final String type;
  const QTypeTextedContainer({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "مقالي":
        return TextedContainer(
          width: 65.w,
          height: 28.h,
          text: "مقالي",
          textColor: MainColors.blueTextColor,
          containerColor: MainColors.lightblue,
          radius: 16.r,
        );
      case "صح وخطأ":
        return TextedContainer(
          width: 88.w,
          height: 28.h,
          text: "صح وخطأ",
          textColor: MainColors.blueTextColor,
          containerColor: MainColors.lightblue,
          radius: 16.r,
        );
      case "أختيار من متعدد":
        return TextedContainer(
          width: 117.w,
          height: 28.h,
          text: "أختيار من متعدد",
          textColor: MainColors.blueTextColor,
          containerColor: MainColors.lightblue,
          radius: 16.r,
        );

      default:
        return TextedContainer(
          width: 117.w,
          height: 28.h,
          text: "نوع غير معرف",
          textColor: MainColors.red,
          containerColor: MainColors.lightRed,
          radius: 16.r,
        );
    }
  }
}
