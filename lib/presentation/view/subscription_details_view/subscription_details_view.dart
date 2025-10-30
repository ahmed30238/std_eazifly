import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class SubscriptionDetailsView extends StatefulWidget {
  const SubscriptionDetailsView({super.key});

  @override
  State<SubscriptionDetailsView> createState() =>
      _SubscriptionDetailsViewState();
}

class _SubscriptionDetailsViewState extends State<SubscriptionDetailsView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    SubscriptiondetailsCubit.get(context).initTabBarControllers(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    // var cubit = SubscriptiondetailsCubit.get(context);
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.subscriptionDetails,
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          8.ph,
          const CustomLinearPercentIndicator(
            alignment: MainAxisAlignment.start,
            percent: .45,
          ),
          24.ph,
          const SubscriptionScreenCustomText(text: "مدة الاشتراك"),
          8.ph,
          const SubscriptionDurationTabs(),
          20.ph,
          const SubscriptionScreenCustomText(text: "نوع الاشتراك"),
          8.ph,
          const SubscriptionTypeTabss(),
          8.ph,
          Row(
            children: [
              SvgPicture.asset(Assets.iconsBulb),
              4.pw,
              Expanded(
                child: Text(
                  "يتم دفع قيمة البرنامج كامل لأول طالب فقط ثم تحصل علي 50 % لاي طالب أخر",
                  style: MainTextStyle.mediumTextStyle(
                    fontSize: 11,
                    color: MainColors.borderPrimary,
                  ),
                ),
              ),
            ],
          ),
          20.ph,
          const SubscriptionScreenCustomText(text: "عدد الاطفال"),
          8.ph,
          const NoOfChildrenList(),
          20.ph,
          const SubscriptionScreenCustomText(text: "أختر الباقة المناسبة"),
          8.ph,
          const PackageList(),
          13.ph,
          ButtonWithPrice(onPressed: () {}),
        ],
      ),
    );
  }
}
