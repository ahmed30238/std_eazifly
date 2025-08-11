import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ButtonWithPrice extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonWithPrice({
    super.key,
    required this.onPressed,
    
  });

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      text: "اشتراك",
      height: 48.h,
      width: 343.w,
      color: MainColors.primary,
      onPressed: onPressed,
      radius: 16.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Text(
              "",
            ),
          ),
          Expanded(
            child: Text(
              "اشتراك",
              style: MainTextStyle.boldTextStyle(
                fontSize: 16,
                color: MainColors.background,
              ),
            ).center(),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: 16.cr,
                  color: MainColors.onSurface,
                ),
                height: 36.h,
                width: 96.w,
                child: Text(
                  "1200 ج.م",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                    color: MainColors.background,
                  ),
                ).center(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}