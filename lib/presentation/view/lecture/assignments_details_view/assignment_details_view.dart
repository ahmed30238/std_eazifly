import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AssignmentDetailsView extends StatelessWidget {
  const AssignmentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "واجب الرياضيات للصف السادس الابتدائي",
        leadingText: "الاختبارات",
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          16.ph,
          StudentStats(
            titleText: const [
              "تاريخ التسليم",
              "درجة التسليم",
              "حالة التسليم",
            ],
            downSideWidgets: [
              Text(
                "2025 - 3 - 12",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blackText,
                ),
              ),
              Text(
                " 100 / 85",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blackText,
                ),
              ),
              TextedContainer(
                width: 81.w,
                text: "جاري التسليم",
                containerColor: MainColors.lightYellow,
                textColor: MainColors.yellow,
              ),
            ],
          ),
          12.ph,
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => const AssigmentItemContainer(),
              separatorBuilder: (context, index) => 16.ph,
              itemCount: 2,
            ),
          ),
          8.ph,
          CustomElevatedButton(
            text: "تسليم الإجابات",
            width: 343.w,
            color: MainColors.blueTextColor,
            radius: 16.r,
            onPressed: () {},
          ),
          32.ph,
        ],
      ),
    );
  }
}

class AssigmentItemContainer extends StatelessWidget {
  const AssigmentItemContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 179.h,
      width: double.infinity,
      color: MainColors.veryLightGrayFormField,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            13.5.ph,
            Text(
              "نص التسليم",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
              ),
            ),
            9.5.ph,
            Container(
              padding: EdgeInsets.all(12.r),
              height: 45.h,
              child: Text(
                "مثال ما هو أكبر كوكب في المجموعة الشمسية؟",
                style: MainTextStyle.mediumTextStyle(fontSize: 14),
              ),
            ),
            16.ph,
            Text(
              "الإجابة",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.checkBoxBorderGray,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.iconsMicrophone),
                8.pw,
                Material(
                  elevation: 1,
                  child: SizedBox(
                    height: 44.h,
                    width: 263.w,
                    child: CustomTextFormField(
                      vPadding: 0,
                      borderRadius: 0.cr,
                      borderColor: MainColors.white,
                      hintText: "   أدخل الإجابة هنا............",
                      filledColor: MainColors.white,
                    ),
                  ),
                ),
                8.pw,
                SvgPicture.asset(Assets.iconsGallery),
              ],
            )
          ],
        ),
      ),
    );
  }
}
