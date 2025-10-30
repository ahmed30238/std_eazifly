import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramStateButton extends StatelessWidget {
  final String state;
  const ProgramStateButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case "ongoing":
        return CustomLowSizeButton(
          height: 28.h,
          width: 96.w,
          text: "اعادة دخول",
          onTap: () {},
        );
      case "dated":
        return CustomLowSizeButton(
          btnColor: MainColors.onSuccess,
          textColor: MainColors.success,
          height: 28.h,
          width: 96.w,
          text: "بعد  2 يوم",
          onTap: () {},
        );

      default:
        return const Text("Unknown");
    }
  }
}
