import 'package:eazifly_student/core/component/titled_form_field.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentDataBody extends StatelessWidget {
  const StudentDataBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AddNewStudentDataToProgramCubit.get(context);

    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              17.ph,
              InkWell(
                onTap: () => pickImageFromGallery(),
                child: Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    MyImages.iconsUserProfile,
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              24.ph,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TitledFormFieldItem(
                      verticalSpace: 8.ph,
                      iconWidget: 0.ph,
                      titleText: "إسم المستخدم ",
                      formfieldHintText: "مثال",
                    ),
                  ),
                  16.pw,
                  Expanded(
                    child: TitledFormFieldItem(
                      iconWidget: 0.ph,
                      keyboardType: TextInputType.number,
                      titleText: "العمر",
                      formfieldHintText: "مثال",
                    ),
                  ),
                ],
              ),
              16.ph,
              TitledFormFieldItem(
                iconWidget: 0.ph,
                titleText: "titleText",
                formfieldHintText: "formfieldHintText",
              ),
              16.ph,
              Text(
                "النوع",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 14,
                  color: MainColors.blackText,
                ),
              ),
              8.ph,
              Row(
                children: List.generate(
                  2,
                  (index) => StudentGenderBox(
                    icon: index == 0 ? MyImages.iconsMale : MyImages.iconsFemal,
                    type: index == 0 ? "ذكر" : "أنثى",
                    padding: 8,
                  ),
                ),
              ),
              16.ph,
              TitledFormFieldItem(
                iconWidget: 0.ph,
                maxLines: 4,
                titleText: "ملاحظات",
                formfieldHintText: "formfieldHintText",
              ),
              16.ph,
              TitledFormFieldItem(
                iconWidget: 0.ph,
                titleText: "أنشأ بريد إلكتروني",
                formfieldHintText: "formfieldHintText",
              ),
              16.ph,
              TitledFormFieldItem(
                iconWidget: 0.ph,
                titleText: "أنشأ كلمة مرور",
                formfieldHintText: "**********",
              ),
            ],
          ),
        ),
        8.ph,
        CustomElevatedButton(
          text: "التالي",
          width: 343.w,
          color: MainColors.blueTextColor,
          radius: 16.w,
          onPressed: () {
            cubit.incrementScreenIndex();
          },
        ),
        32.ph,
      ],
    );
  }
}

class StudentGenderBox extends StatelessWidget {
  final String icon;
  final String type;
  final double? padding;
  const StudentGenderBox({
    super.key,
    required this.icon,
    this.padding,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(left: padding ?? 0, right: padding ?? 0),
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: 8.cr,
          border: Border.all(
            color: MainColors.formFieldgraySecondBorderColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
            ),
            8.pw,
            Text(
              type,
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}
