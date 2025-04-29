import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/explain_point_view/widgets/time-line_widget.dart';
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

