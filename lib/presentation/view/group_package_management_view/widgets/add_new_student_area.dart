

import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class AddNewStudentArea extends StatelessWidget {
  const AddNewStudentArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "الطلاب المسجلين",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.add,
                size: 20,
                color: MainColors.blueTextColor,
              ),
              4.pw,
              Text(
                "أضافة طالب جديد",
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                  color: MainColors.blueTextColor,
                ),
              ),
            ],
          ),
        ),
        4.ph,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              SvgPicture.asset(
                MyImages.iconsBulb,
              ),
              Text(
                "أختر الطلاب الذي تود إشراكهم في البرنامج",
                style: MainTextStyle.mediumTextStyle(
                  fontSize: 11,
                  color: MainColors.checkBoxBorderGray,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}