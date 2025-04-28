import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
