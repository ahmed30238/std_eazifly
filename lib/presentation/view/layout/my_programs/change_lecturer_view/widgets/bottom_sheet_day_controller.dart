import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class BottomSheetDayContainer extends StatelessWidget {
  final String day;
  final VoidCallback onTap;
  const BottomSheetDayContainer({
    super.key,
    required this.onTap,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 343.w,
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        height: 45.h,
        child: Text(
          day,
          style: MainTextStyle.boldTextStyle(fontSize: 14),
        ),
      ),
    );
  }
}