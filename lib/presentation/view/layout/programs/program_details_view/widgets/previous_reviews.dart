import 'package:eazifly_student/core/component/stars_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class PreviousReviewsTab extends StatelessWidget {
  const PreviousReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 8.h),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        padding: EdgeInsets.all(8.r),
        constraints: BoxConstraints(minHeight: 72.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContainer(
                  containerHeight: 20.h,
                  containerWidth: 20.w,
                  shape: BoxShape.circle,
                ),
                8.pw,
                Text(
                  "إسم الطالب",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                StarsWidget(
                  rating: 5,
                  starSize: 15.r,
                )
              ],
            ),
            Text(
              index == 1
                  ? "إستفدت جدا من هذا البرنامج وأيضا المعلم كان متعاون معنا جدا إستفدت جدا من هذا البرنامج وأيضا المعلم كان متعاون معنا جدا "
                  : "إستفدت جدا من هذا البرنامج وأيضا المعلم كان متعاون معنا جدا",
              style: MainTextStyle.boldTextStyle(
                fontSize: 11,
                color: MainColors.grayTextColors,
              ),
            )
          ],
        ),
      ),
      itemCount: 4,
    );
  }
}
