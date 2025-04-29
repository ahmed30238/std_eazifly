import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ConfirmPaymentView extends StatelessWidget {
  const ConfirmPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.confirmPaymentProcess,
        leadingText: "",
        isCenterTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            // margin: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            height: 402.h,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "برنامج جيل القرآن",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                  ),
                ),
                12.ph,
                ...List.generate(
                  5,
                  (index) => ProgramDetailsItem(
                    title: programDetailsTitles[index],
                  ),
                ),
                3.ph,
                const CustomHorizontalDivider(
                  color: MainColors.lightGray,
                ),
                ...List.generate(
                  3,
                  (index) => ProgramDetailsItem(
                    title: cashDetailsTitles[index],
                    textStyle: index == 2
                        ? MainTextStyle.boldTextStyle(
                            fontSize: 15,
                            color: MainColors.blueTextColor,
                          )
                        : null,
                  ),
                ),
                4.ph,
              ],
            ),
          ),
          20.ph,
          Text(
            "طريقة التحويل",
            style: MainTextStyle.boldTextStyle(
              fontSize: 12,
              color: MainColors.checkBoxBorderGray,
            ),
          ),
          8.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            // margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 82.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Row(
              children: [
                Text(
                  "1",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.blackText,
                  ),
                ),
                20.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "قم بتحويل مبلغ 2000 ج.م الي رقم عبر فودافون كاش ",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.blackText,
                      ),
                    ),
                    8.ph,
                    Text(
                      "01030837974",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.blackText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            // margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 98.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "2",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.blackText,
                  ),
                ),
                20.pw,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "قم برفع صورة  التحويل هنا",
                      style: MainTextStyle.boldTextStyle(
                        fontSize: 12,
                        color: MainColors.blackText,
                      ),
                    ),
                    8.ph,
                    Container(
                      width: 68.w,
                      height: 34.h,
                      decoration: BoxDecoration(
                        color: MainColors.lightblue,
                        borderRadius: 16.cr,
                      ),
                      child: SvgPicture.asset(
                        Assets.iconsUploadImage,
                        fit: BoxFit.scaleDown,
                      ).center(),
                    )
                  ],
                ),
              ],
            ),
          ),
          16.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            // margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 166.63.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "مثال لطريقة التحويل",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.blackText,
                  ),
                ),
                8.ph,
                Text(
                  "قم بأخد سكرين شوت من المبلغ المحول كما في المثال ",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.checkBoxBorderGray,
                  ),
                ),
                4.ph,
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    Assets.iconsAboutAppIcon,
                    height: 60.h,
                    width: 60.w,
                  ),
                ), // todo replace with its icon
              ],
            ),
          ),
          28.37.ph,
          CustomElevatedButton(
            text: "إتمام الدفع",
            width: 343.w,
            onPressed: () {
              // Timer.periodic(
              //   const Duration(milliseconds: 100),
              //   (timer) => showAdaptiveDialog(
              //     context: context,
              //     builder: (context) => const CustomDialog(
              //       title: "جاري مراجعة طلب التحويل",
              //       subTitle: "سيتم ارسال اشعار التاكيد في اقرب وقت ",
              //       loader: true,
              //     ),
              //   ),
              // );

              Navigator.pushNamed(context, RoutePaths.programsUnderReviewView);
            },
            color: MainColors.blueTextColor,
            radius: 16.r,
          ),
          32.ph,
        ],
      ),
    );
  }
}

var programDetailsTitles = [
  "خطة اللإشتراك",
  "مدة الدرس",
  "عدد الطلاب",
  "عدد الحصص الإسبوعية",
  "تاريخ البدء",
];
var cashDetailsTitles = [
  "المبلغ ",
  "الخصم",
  "الإجمالي",
];

class ProgramDetailsItem extends StatelessWidget {
  final TextStyle? textStyle;
  final String title;
  const ProgramDetailsItem({
    required this.title,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: textStyle ??
                  MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.checkBoxBorderGray,
                  ),
            ),
            Text(
              "خطة اللإشتراك",
              style: textStyle ??
                  MainTextStyle.boldTextStyle(
                    fontSize: 12,
                    color: MainColors.checkBoxBorderGray,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
