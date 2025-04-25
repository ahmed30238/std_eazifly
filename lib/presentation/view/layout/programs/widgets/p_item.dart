import 'package:eazifly_student/presentation/view/layout/programs/widgets/dummy_data.dart';
import 'package:eazifly_student/presentation/view/layout/programs/widgets/teacher_program_details_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class Item extends StatelessWidget {
  const Item({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MainColors.veryLightGrayFormField,
      constraints: BoxConstraints(minHeight: 322.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageContainer(
            containerHeight: 163.h,
            containerWidth: double.infinity,
            radius: 0,
          ),
          12.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "الرياضيات للصف السادس الإبتدائي",
              style: MainTextStyle.boldTextStyle(fontSize: 14),
            ),
          ),
          4.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "إكتشفوا جمال تعلم القرآن من خلال دروسنا المصممة خصيصًا لقادة المستقبل",
              style: MainTextStyle.mediumTextStyle(
                fontSize: 12,
                color: MainColors.grayTextColors,
              ),
            ),
          ),
          12.ph,
          const CustomHorizontalDivider(),
          SizedBox(
            height: 60.h,
            child: Row(
              children: List.generate(
                3,
                (index) => TeacherProgramDetailsItem(
                  model: teacherProgramDetailsList[index],
                  listIndex: index,
                  index: index,
                ),
              ),
            ),
          ),
          16.ph,
        ],
      ),
    );
  }
}