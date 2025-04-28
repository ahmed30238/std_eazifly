import 'dart:ui';

import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChooseTeacherBody extends StatelessWidget {
  const ChooseTeacherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          32.ph,
          Row(
            children: [
              Expanded(
                child: Text(
                  "الهدف",
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
              ),
              16.pw,
              Expanded(
                flex: 9,
                child: InkWell(
                  onTap: () => showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  ),
                  child: CustomTextFormField(
                    filledColor: MainColors.grayBorderColor,
                    enabled: false,
                    hintText: "اختر",
                    suffixIconWidget: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: SvgPicture.asset(
                        MyImages.iconsCalender,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          24.ph,
          Row(
            children: [
              Expanded(
                child: Text(
                  "المستوي",
                  style: MainTextStyle.boldTextStyle(fontSize: 12),
                ),
              ),
              16.pw,
              Expanded(
                flex: 9,
                child: InkWell(
                  onTap: () => showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  ),
                  child: CustomTextFormField(
                    filledColor: MainColors.grayBorderColor,
                    enabled: false,
                    hintText: "اختر",
                    suffixIconWidget: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                      ),
                      child: SvgPicture.asset(
                        MyImages.iconsCalender,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          32.ph,
          Text(
            "المعملين المطابقين لاختيارك",
            style: MainTextStyle.boldTextStyle(fontSize: 12),
          ),
          8.ph,
          SizedBox(
            height: 157.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const SuggestedTeachersItem(),
              separatorBuilder: (context, index) => 16.pw,
              itemCount: 5,
            ),
          ),
          32.ph,
          Text(
            "أختر الموعد المناسب من مواعيد المعلم",
            style: MainTextStyle.boldTextStyle(fontSize: 12),
          ),
          24.ph,
          Row(
            children: [
              Expanded(
                child: TitledFormFieldItem(
                  iconWidget: 0.ph,
                  titleText: "اليوم",
                  formfieldHintText: "formfieldHintText",
                ),
              ),
              16.pw,
              Expanded(
                child: TitledFormFieldItem(
                  iconWidget: 0.ph,
                  titleText: "الوقت",
                  formfieldHintText: "formfieldHintText",
                ),
              ),
            ],
          ),
          const Spacer(),
          CustomElevatedButton(
            width: 343.w,
            text: "اضافة",
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.studentManagement);
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

class SuggestedTeachersItem extends StatelessWidget {
  const SuggestedTeachersItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Container(
        height: 157.h,
        width: 243.w,
        decoration: BoxDecoration(
          borderRadius: 12.cr,
          color: MainColors.lightblue,
          border: Border.all(
            color: MainColors.blueTextColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageContainer(
              containerHeight: 50.h,
              containerWidth: 50.w,
              radius: 16.r,
            ),
            8.ph,
            Text(
              "أحمد سلامة",
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
              ),
            ),
            12.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLowSizeButton(
                  btnColor: MainColors.white,
                  width: 62.w,
                  text: "قران",
                  onTap: () {},
                ),
                8.pw,
                CustomLowSizeButton(
                  btnColor: MainColors.white,
                  width: 69.w,
                  text: "تجويد",
                  onTap: () {},
                ),
                8.pw,
                CustomLowSizeButton(
                  btnColor: MainColors.white,
                  width: 64.w,
                  text: "حفظ",
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
