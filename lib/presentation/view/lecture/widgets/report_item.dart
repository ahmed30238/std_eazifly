import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ReportItem extends StatelessWidget {
  final VoidCallback? onTap;
  const ReportItem({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "تقرير1",
                  style: MainTextStyle.boldTextStyle(fontSize: 14),
                ),
                Text(
                  "AM 8 : 35 ",
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
              ],
            ),
            4.ph,
            Text(
              "مثال : هذا النص هو جزء من عملية تحسين تجربة المستخدم من خلال النص",
              style: MainTextStyle.mediumTextStyle(
                fontSize: 11,
                color: MainColors.grayTextColors,
              ),
            ),
            4.ph,
            Text(
              "مثال : يبالايلب ايسلم بيمب  شيك لوريم لوريم لوريم",
              style: MainTextStyle.mediumTextStyle(
                fontSize: 11,
                color: MainColors.grayTextColors,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
