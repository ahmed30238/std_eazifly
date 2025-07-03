import 'dart:ui';

import 'package:eazifly_student/core/component/avatar_image.dart';
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
                        Assets.iconsCalender,
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
                        Assets.iconsCalender,
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
              itemBuilder: (context, index) => SuggestedTeachersItem(
                onTap: (){},
                image: "",
                instructorName: "name",
                isSelected: index == 0,
              ),
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
  final String image;
  final String instructorName;
  final bool isSelected;
  final VoidCallback onTap;

  final bool blured;
  const SuggestedTeachersItem({
    super.key,
    this.blured = true,
    required this.image,
    required this.instructorName,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BackdropFilter(
        filter:
            ImageFilter.blur(sigmaX: blured ? 3 : 0, sigmaY: blured ? 3 : 0),
        child: Container(
          height: 157.h,
          width: 243.w,
          decoration: BoxDecoration(
            borderRadius: 12.cr,
            color: isSelected ? MainColors.lightblue : MainColors.white,
            border: Border.all(
              color: isSelected
                  ? MainColors.blueTextColor
                  : MainColors.grayBorderColor,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarImage(
                height: 50.h,
                width: 50.w,
                radius: 16.r,
                imageUrl: image,
              ),
              8.ph,
              Text(
                instructorName,
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
      ),
    );
  }
}
