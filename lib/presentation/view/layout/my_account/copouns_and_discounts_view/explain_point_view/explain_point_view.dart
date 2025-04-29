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
            (index) => TimlineItem(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تسجيل حساب جديد",
                        style: MainTextStyle.boldTextStyle(fontSize: 15),
                      ),
                      4.ph,
                      Text(
                        "بمجرد إنشاء حساب جديد تحصل علي مكأفاه ترحيبية",
                        style: MainTextStyle.mediumTextStyle(
                          fontSize: 12,
                          color: MainColors.grayTextColors,
                        ),
                      ),
                      4.ph,
                      Text(
                        " 50 نقطة",
                        style: MainTextStyle.mediumTextStyle(
                          fontSize: 12,
                          color: MainColors.blueTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


