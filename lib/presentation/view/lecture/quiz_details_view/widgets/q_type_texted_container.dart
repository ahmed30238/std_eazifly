import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class QTypeTextedContainer extends StatelessWidget {
  final String type;

  const QTypeTextedContainer({super.key, required this.type});

  static const Map<String, String> _normalizedTypes = {
    "مقالي": "text",
    "text": "text",
    "صح وخطأ": "true_false",
    "true_false": "true_false",
    "أختيار من متعدد": "multiple_choice",
    "اختيار من متعدد": "multiple_choice", // بدون همزة
    "multiple_choice": "multiple_choice",
  };

  @override
  Widget build(BuildContext context) {
    final normalizedType =
        _normalizedTypes[type.trim().toLowerCase()] ?? "unknown";

    switch (normalizedType) {
      case "text":
        return TextedContainer(
          width: 65.w,
          height: 28.h,
          text: "مقالي",
          textColor: MainColors.primary,
          containerColor: MainColors.surface,
          radius: 16.r,
        );
      case "true_false":
        return TextedContainer(
          width: 88.w,
          height: 28.h,
          text: "صح وخطأ",
          textColor: MainColors.primary,
          containerColor: MainColors.surface,
          radius: 16.r,
        );
      case "multiple_choice":
        return TextedContainer(
          width: 117.w,
          height: 28.h,
          text: "أختيار من متعدد",
          textColor: MainColors.primary,
          containerColor: MainColors.surface,
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
