import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AnwerStateContainer extends StatelessWidget {
  final String state;
  const AnwerStateContainer({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case "إجابة صحيحة":
        return TextedContainer(
          width: 105.w,
          height: 28.h,
          text: "إجابة صحيحة",
          textColor: MainColors.success,
          containerColor: MainColors.onSuccess,
          radius: 16.r,
        );
      case "إجابة خطأ":
        return TextedContainer(
          width: 88.w,
          height: 28.h,
          text: "إجابة خطأ",
          textColor: MainColors.onError,
          containerColor: MainColors.error,
          radius: 16.r,
        );
      default:
        return TextedContainer(
          width: 117.w,
          height: 28.h,
          text: "نوع غير معرف",
          textColor: MainColors.onError,
          containerColor: MainColors.error,
          radius: 16.r,
        );
    }
  }
}
