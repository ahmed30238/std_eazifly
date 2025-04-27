import 'package:eazifly_student/core/component/stars_widget.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class LecturerDataTab extends StatelessWidget {
  const LecturerDataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 348.h,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 72.h,
            child: Row(
              children: [
                ImageContainer(
                  containerHeight: 40.h,
                  containerWidth: 40.w,
                  shape: BoxShape.circle,
                ),
                12.pw,
                Text(
                  "احمد عبد الحميد سلامة",
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          const CustomHorizontalDivider(),
          const ItemDetailsCard(
            titles: [
              "عدد الطلاب",
              "البرامج السابقة",
              "بيانات",
            ],
          ),
          const CustomHorizontalDivider(),
          12.ph,
          Text(
            "تقييمات المعلم",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.grayTextColors,
            ),
          ),
          8.ph,
          Expanded(
            child: ListView.builder(
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
            ),
          ),
        ],
      ),
    );
  }
}
