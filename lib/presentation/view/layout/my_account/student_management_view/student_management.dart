import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentManagementView extends StatelessWidget {
  const StudentManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(     context,
        mainTitle: "ادارة الطلاب",
        isCenterTitle: true,
        leadingText: lang.back,
        onLeadinTap: () => back(context),
        leadingCustomWidth: 100.w,
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemBuilder: (context, index) => StudentDataItem(
          index: index,
          onTrailingIconTap: () {
                showModalSheet(
                  minHeight: 350.h,
                  maxHeight: 351.h,
                  isFixedSize: true,
                  context,
                  widget: Container(
                    height: 200.h,
                    width: 375.w,
                    decoration: BoxDecoration(
                      borderRadius: 12.cr,
                      color: MainColors.white,
                    ),
                    child: Column(
                      children: [
                        16.ph,
                        Text(
                          "تعديل بيانات الطالب",
                          style: MainTextStyle.boldTextStyle(fontSize: 14),
                        ),
                        16.ph,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(MyImages.iconsProfile),
                            8.pw,
                            Text(
                              "تعديل",
                              style: MainTextStyle.boldTextStyle(fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
        ),
        itemCount: 13,
        separatorBuilder: (context, index) => 10.ph,
      ),
    );
  }
}

