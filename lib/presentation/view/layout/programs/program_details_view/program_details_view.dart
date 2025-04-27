import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/presentation/controller/home_program_details_controller/programdetails_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramDetailsView extends StatefulWidget {
  const ProgramDetailsView({super.key});

  @override
  State<ProgramDetailsView> createState() => _ProgramDetailsViewState();
}

class _ProgramDetailsViewState extends State<ProgramDetailsView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    ProgramDetailsCubit.get(context).initController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = ProgramDetailsCubit.get(context);
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تفاصيل البرنامج",
        leadingText: "البرامج",
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Column(
                  children: [
                    16.ph,
                    ImageContainer(
                      containerHeight: 188.h,
                      containerWidth: double.infinity,
                      radius: 16.r,
                      fit: BoxFit.cover,
                    ),
                    16.ph,
                    SizedBox(
                      height: 29.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "برنامج جيل القرآن",
                            style: MainTextStyle.boldTextStyle(fontSize: 14),
                          ),
                          TextedContainer(
                            text: "540 ج.م",
                            radius: 8.r,
                            width: 67.w,
                            containerColor: MainColors.lightblue,
                            textColor: MainColors.blueTextColor,
                          ),
                        ],
                      ),
                    ),
                    8.ph,
                    Text(
                      "اكتشفوا جمال تعلم القرآن من خلال دروسنا المصممة خصيصًا لقادة المستقبل. انضموا إلى دروسنا الفردية المباشرة مع معلم أو معلمة، حددوا أهداف أولادك وسنعد خطة مُخصّصة لتلبية احتياجاتهم. يقدّم فريقنا الدعم المباشر لضمان استمرار الأولاد في رحلتهم التعليمية. احصلوا على التحكم الكامل من خلال منصتنا في جدولة الحصص، ومراجعة التقارير، والتسليمات، ومتابعة تقدمكم بشكل تلقائي .",
                      style: MainTextStyle.mediumTextStyle(
                        fontSize: 12,
                        color: MainColors.grayTextColors,
                      ).copyWith(height: 1.5.h),
                    ),
                    16.ph,
                    const StudentStats(
                      horizontalPadding: 0,
                      titleText: ["عدد الطلاب", "مستوي البرنامج", "سعر الساعة"],
                      descText: ["18 طالب", "متوسط", "120 ج.م"],
                    ),
                    12.ph,
                  ].itemPadding(rightPadding: 16.w, leftPadding: 16.w),
                ),
                BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) => CustomTabBar(
                    controller: cubit.controller,
                    tabs: List.generate(
                      cubit.tabs.length,
                      (index) {
                        bool isSelected = cubit.controller.index == index;
                        return Text(
                          cubit.tabs[index],
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? MainColors.blueTextColor
                                : MainColors.grayTextColors,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                BlocBuilder(
                  bloc: cubit,
                  builder: (context, state) => SizedBox(
                    height: cubit.controller.index == 0 ? (40 * 4) + 16 : 348.h,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: cubit.controller,
                      children: cubit.screens,
                    ),
                  ),
                ),
              ],
            ),
          ),
          8.ph,
          ButtonWithPrice(
            onPressed: () => Navigator.pushNamed(
                context, RoutePaths.programSubscriptionPlan),
          ),
          32.ph,
        ],
      ),
    );
  }
}
