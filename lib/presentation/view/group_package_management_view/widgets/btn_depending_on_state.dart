

import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ButtonDependingOnState extends StatelessWidget {
  final String state;
  const ButtonDependingOnState({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case "done":
        return CustomLowSizeButton(
          height: 28.h,
          width: 71.w,
          text: "تم التعيين",
          btnColor: MainColors.lightgreenTeal,
          textColor: MainColors.greenTeal,
          borderRadius: 8.cr,
          onTap: () {},
        );
      case "pending":
        return CustomLowSizeButton(
          width: 90.w,
          height: 28.h,
          text: "أضغط للتعيين",
          btnColor: MainColors.lightRed,
          textColor: MainColors.red,
          borderRadius: 8.cr,
          onTap: () {},
        );

      default:
        return const Text("Unknown");
    }
  }
}