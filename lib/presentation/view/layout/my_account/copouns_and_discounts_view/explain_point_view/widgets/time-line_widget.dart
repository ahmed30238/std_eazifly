
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class TimeLineWidgets extends StatelessWidget {
  final int index;
  final List<String> titles;
  const TimeLineWidgets({
    super.key,
    required this.index,
    required this.titles,
  });

  @override
  Widget build(BuildContext context) {
    return TimlineItem(
      indicator: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: MainColors.timeLineColor,
          ),
        ),
        child: Text(
          "${index + 1}",
          style: MainTextStyle.boldTextStyle(fontSize: 16),
        ).center(),
      ),
      isFirst: index == 0,
      isLast: index == 2,
      child: Row(
        children: [
          10.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titles[index],
                  style: MainTextStyle.boldTextStyle(fontSize: 15),
                ),
                4.ph,
                CustomRichText(
                  spaceText: index == 2 ? " 15 نقطة" : "",
                  spaceStyle: MainTextStyle.mediumTextStyle(
                    fontSize: 12,
                    color: MainColors.blueTextColor,
                  ),
                  text1: index == 0
                      ? "بمجرد إنشاء حساب جديد تحصل علي مكأفاه ترحيبية"
                      : index == 1
                          ? "عند الإشتراك في البرامج تحصل علي مكافأت يمكنك إستبدالها للحصول علي خصومات"
                          : "عند مشاركة التطبيق تحصل علي",
                  text1Style: MainTextStyle.mediumTextStyle(
                    fontSize: 12,
                    color: MainColors.grayTextColors,
                  ),
                  text2: index == 0
                      ? "\n 50 نقطة"
                      : index == 1
                          ? ""
                          : " مكافأه",
                  text2Style: index == 0
                      ? MainTextStyle.mediumTextStyle(
                          fontSize: 12,
                          color: MainColors.blueTextColor,
                        )
                      : MainTextStyle.mediumTextStyle(
                          fontSize: 12,
                          color: MainColors.grayTextColors,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}