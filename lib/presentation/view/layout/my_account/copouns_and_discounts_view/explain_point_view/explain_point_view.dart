import 'package:eazifly_student/core/component/custom_rich_text.dart';
import 'package:eazifly_student/core/component/timeline_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ExplainPointsSystemView extends StatelessWidget {
  const ExplainPointsSystemView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "شرح النقاط و المكافأت",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              Assets.iconsExplainPointsSystem,
              height: 172.h,
              width: 191.w,
            ),
          ),
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "يمكنك الحصول علي نقاط من إستخدام التطبيق",
              style: MainTextStyle.boldTextStyle(fontSize: 16),
            ),
          ),
          8.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "أتبع الخطوات التالية لإستخدام نقاطك والاستفاده منها والحصول علي خصومات ",
              style: MainTextStyle.mediumTextStyle(
                fontSize: 14,
                color: MainColors.grayTextColors,
              ),
            ),
          ),
          16.ph,
          ...List.generate(
            3,
            (index) => TimeLineWidgets(
              index: index,
              titles: timelineTitles,
              descs: sdasd("50 نقطة"),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeLineWidgets extends StatelessWidget {
  final int index;
  final List<String> titles;
  final List<String> descs;
  const TimeLineWidgets({
    super.key,
    required this.index,
    required this.titles,
    required this.descs,
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

List<String> timelineTitles = [
  "تسجيل حساب جديد",
  "أحجز البرامج المناسبة لإختيارك",
  "دعوة الأصدقاء",
];
List<String> sdasd(String dddd) {
  List<String> timelineDescriptions = [
    "عند الإشتراك في البرامج تحصل علي مكافأت يمكنك إستبدالها للحصول علي خصومات",
    "عند مشاركة التطبيق تحصل علي 15 نقطة مكافأه",
  ];
  return timelineDescriptions;
}
