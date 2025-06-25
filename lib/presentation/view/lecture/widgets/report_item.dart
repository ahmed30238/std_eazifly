import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ReportItem extends StatelessWidget {
  final String title;
  final String description;
  final String createdAt;
  final VoidCallback? onTap;
  const ReportItem({
    super.key,
    this.onTap,
    required this.createdAt,
    required this.description,
    required this.title,
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
                Expanded(
                  child: Text(
                    title,
                    style: MainTextStyle.boldTextStyle(fontSize: 14),
                  ),
                ),
                Text(
                  createdAt,
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 11,
                    color: MainColors.grayTextColors,
                  ),
                ),
              ],
            ),
            4.ph,
            Text(
             description,
              style: MainTextStyle.mediumTextStyle(
                fontSize: 11,
                color: MainColors.grayTextColors,
              ),
            ),
            4.ph,
            // Text(
            //   "مثال : يبالايلب ايسلم بيمب  شيك لوريم لوريم لوريم",
            //   style: MainTextStyle.mediumTextStyle(
            //     fontSize: 11,
            //     color: MainColors.grayTextColors,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
