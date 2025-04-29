import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/presentation/controller/program_subscription_plan/programsubscriptionplan_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ProgramSubscriptionPlanView extends StatelessWidget {
  const ProgramSubscriptionPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    ProgramsubscriptionplanCubit cubit =
        ProgramsubscriptionplanCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تفاصيل البرنامج",
        leadingText: lang.thePrograms,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                24.ph,
                const CustomHorizontalDivider(),
                16.ph,
                SizedBox(
                  height: 21.h,
                  child: Text(
                    "خطة الاشتراك",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                12.ph,
                SizedBox(
                  height: 69.h,
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SubscriptionPlanCardItem(
                        isSelected: index == cubit.planIndex,
                        icons: planIcons[index],
                        onTap: () {
                          cubit.changePlanIndex(index);
                        },
                      ),
                      separatorBuilder: (context, index) => 10.pw,
                      itemCount: 3,
                    ),
                  ),
                ),
                16.ph,
                SizedBox(
                  height: 21.h,
                  child: Text(
                    "مدة الدرس",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                12.ph,
                SizedBox(
                  height: 69.h,
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => LessonDurationCardItem(
                        isSelected: index == cubit.lessonDurationIndex,
                        icons: planIcons[index],
                        onTap: () {
                          cubit.changelessonDurationIndex(index);
                        },
                      ),
                      separatorBuilder: (context, index) => 10.pw,
                      itemCount: 3,
                    ),
                  ),
                ),
                20.ph,
                const CustomHorizontalDivider(),
                16.ph,
                TitledFormFieldItem(
                  titleText: "عدد الطلاب",
                  iconWidget: 0.ph,
                  formfieldHintText: "2",
                ),
                16.ph,
                TitledFormFieldItem(
                  titleText: "عدد الحصص أسبوعيا",
                  iconWidget: 0.ph,
                  formfieldHintText: "2",
                ),
                16.ph,
                TitledFormFieldItem(
                  titleText: "تاريخ البدء",
                  iconWidget: 0.ph,
                  formfieldHintText: "12-5-2025",
                ),
                16.ph,
                const CustomHorizontalDivider(),
                16.ph,
                16.ph,
                SizedBox(
                  height: 21.h,
                  child: Text(
                    "الكوبونات والخصومات",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                16.ph,
                TitledFormFieldItem(
                  titleText: "كوبون خصم",
                  iconWidget: 0.ph,
                  formfieldHintText: "asd151",
                ),
                16.ph,
                TitledFormFieldItem(
                  titleText: "كوبون مشاركة صديق",
                  iconWidget: 0.ph,
                  formfieldHintText: "ASD151",
                ),
                16.ph,
                SizedBox(
                  height: 21.h,
                  child: Text(
                    "خدمات اضافية",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                16.ph,
                ...List.generate(
                  2,
                  (index) => Row(
                    children: [
                      Checkbox.adaptive(
                        activeColor: MainColors.blueTextColor,
                        value: index == 0,
                        onChanged: (val) {},
                      ),
                      Text(
                        index == 0
                            ? "إختيار موعد الحصص مخصص"
                            : "تسجيل الحصص الخاص بك",
                        style: MainTextStyle.boldTextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                16.ph,
                const CustomHorizontalDivider(),
                43.ph,
                Row(
                  children: [
                    Checkbox.adaptive(
                      activeColor: MainColors.blueTextColor,
                      value: false,
                      onChanged: (val) {},
                    ),
                    Text(
                      "أوافق علي الشروط والأحكام و سياسة الخصوصية",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          8.ph,
          ButtonWithPrice(
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.completePaymentProcessScreen);
            },
          ),
          32.ph,
        ],
      ),
    );
  }
}

class SubscriptionPlanCardItem extends StatelessWidget {
  final String icons;
  final bool isSelected;
  final VoidCallback onTap;
  const SubscriptionPlanCardItem({
    super.key,
    required this.isSelected,
    required this.icons,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? MainColors.lightblue : MainColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        height: 69.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icons,
              colorFilter: ColorFilter.mode(
                isSelected ? MainColors.blueTextColor : MainColors.black,
                BlendMode.srcIn,
              ),
            ),
            4.ph,
            Text(
              "data",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: isSelected ? MainColors.blueTextColor : MainColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LessonDurationCardItem extends StatelessWidget {
  final String icons;
  final bool isSelected;
  final VoidCallback onTap;
  const LessonDurationCardItem({
    super.key,
    required this.isSelected,
    required this.icons,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? MainColors.lightblue : MainColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        height: 69.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "30",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: isSelected ? MainColors.blueTextColor : MainColors.black,
              ),
            ),
            4.ph,
            Text(
              "دقيقة",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: isSelected ? MainColors.blueTextColor : MainColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var planIcons = [
  Assets.iconsLoadingSand,
  Assets.iconsSecurityTime,
  Assets.iconsCalender
];
