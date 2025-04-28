import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SchedulesBody extends StatelessWidget {
  const SchedulesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const ScheduleItem(),
      separatorBuilder: (context, index) => 8.ph,
      itemCount: 8,
    );
  }
}

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      height: 74.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MainColors.veryLightGrayFormField,
      ),
      child: SizedBox(
        height: 74.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "تاريخ المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  8.ph,
                  Text(
                    "الإثنين  12-3-2025",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "وقت المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  8.ph,
                  Expanded(
                    child: Text(
                      "12:45 الي 1:00 ",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            27.pw,
            InkWell(
              onTap: () {},
              child: Text(
                "تعديل الموعد",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blueTextColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
