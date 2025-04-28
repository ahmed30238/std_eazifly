import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class Lecturehistoryview extends StatelessWidget {
  const Lecturehistoryview({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "تاريخ المحاضرات",
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          16.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: 74.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: 12.cr,
              color: MainColors.veryLightGrayFormField,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: SizedBox(
                    width: 216.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "إسم البرنامج",
                          style: MainTextStyle.boldTextStyle(
                              fontSize: 11, color: MainColors.grayTextColors),
                        ),
                        10.5.ph,
                        Text(
                          "محاضرة رياضيات للصف السادس",
                          style: MainTextStyle.boldTextStyle(
                              fontSize: 12, color: MainColors.blackText),
                        ),
                      ],
                    ),
                  ),
                ),
                20.pw,
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 13.5.h,
                  ),
                  child: SizedBox(
                    height: 50.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "موعد تجديد الإشتراك",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 11,
                            color: MainColors.grayTextColors,
                          ),
                        ),
                        4.ph,
                        TextedContainer(
                          width: 80.w,
                          height: 26.h,
                          text: "بعد 3 أيام",
                          containerColor: MainColors.lightRed,
                          textColor: MainColors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.ph,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            constraints: BoxConstraints(
              minHeight: 198.h,
            ),
            decoration: const BoxDecoration(
              color: MainColors.veryLightGrayFormField,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.ph,
                Text(
                  "تاريخ المحاضرات",
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 14,
                  ),
                ),
                12.ph,
                SizedBox(
                  height: 8 * 155,
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        const LectureHistoryDetails(),
                    separatorBuilder: (context, index) => 8.ph,
                    itemCount: 8,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LectureHistoryDetails extends StatelessWidget {
  const LectureHistoryDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      constraints: BoxConstraints(
        minHeight: 149.h,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: 16.cr,
        color: MainColors.white,
      ),
      child: Column(
        children: [
          16.ph,
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "إسم المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  8.ph,
                  Text(
                    "تعليم أصول الفقة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: MainColors.blackText,
                    ),
                  ),
                ],
              ),
              50.pw,
              Column(
                children: [
                  Text(
                    "حالة المحاضرة",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 11,
                      color: MainColors.grayTextColors,
                    ),
                  ),
                  4.ph,
                  TextedContainer(
                    height: 26.h,
                    radius: 32.r,
                    width: 60.w,
                    text: "قادمة",
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => showModalSheet(context,
                    widget: const CustomBottomSheetDesign()),
                child: SvgPicture.asset(
                  MyImages.iconsHorizontalDots,
                ),
              ),
            ],
          ),
          const CustomHorizontalDivider(),
          const ItemDetailsCard(
            titles: [
              "تاريخ المحاضرة",
              "وقت المحاضرة",
              "مدة المحاضرة",
            ],
          ),
        ],
      ),
    );
  }
}
