import 'package:eazifly_student/presentation/controller/add_new_student_data_to_program_controller/add_new_student_data_to_program_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class RegistrationTypeBody extends StatelessWidget {
  final bool isRegisteringMySelf;
  const RegistrationTypeBody({
    super.key,
    this.isRegisteringMySelf = false,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = AddNewStudentDataToProgramCubit.get(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isRegisteringMySelf) ...[
          55.h.ph,
          InkWell(
            onTap: () {
              cubit.incrementScreenIndex();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 49.w, vertical: 24.h),
              height: 235.h,
              width: 248.w,
              decoration: BoxDecoration(
                borderRadius: 24.cr,
                color: MainColors.surfaceContainerHighest,
              ),
              child: Column(
                children: [
                  SvgPicture.asset(Assets.iconsAddMyself),
                  Text(
                    "تسجيل نفسي في البرنامج",
                    style: MainTextStyle.boldTextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          32.ph,
        ],
        InkWell(
          onTap: () => cubit.incrementScreenIndex(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 49.w, vertical: 24.h),
            height: 235.h,
            width: 248.w,
            decoration: BoxDecoration(
              borderRadius: 24.cr,
              color: MainColors.surfaceContainerHighest,
            ),
            child: Column(
              children: [
                SvgPicture.asset(Assets.iconsAddAnotherStudent),
                Text(
                  "أضافة طالب أخر",
                  style: MainTextStyle.boldTextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
