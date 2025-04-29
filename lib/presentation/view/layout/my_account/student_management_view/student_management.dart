import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentManagementView extends StatelessWidget {
  const StudentManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "ادارة الطلاب",
        isCenterTitle: true,
        leadingText: lang.back,
        onLeadinTap: () => back(context),
        leadingCustomWidth: 100.w,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              itemBuilder: (context, index) => StudentDataItem(
                index: index,
                onTrailingIconTap: () {
                  showModalSheet(
                    minHeight: 260.h,
                    maxHeight: 261.h,
                    isFixedSize: true,
                    context,
                    widget: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      height: 260.h,
                      width: 375.w,
                      decoration: BoxDecoration(
                        borderRadius: 12.cr,
                        color: MainColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          24.ph,
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutePaths.lectureView,
                                arguments: false,
                              );
                            },
                            child: SizedBox(
                              height: 45.h,
                              child: Text(
                                "عرض باقي البيانات",
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              height: 45.h,
                              child: Text(
                                "تعديل بيانات الطالب",
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              height: 45.h,
                              child: Text(
                                "حذف الطالب",
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutePaths.lectureHistoryView,
                              );
                            },
                            child: SizedBox(
                              height: 45.h,
                              child: Text(
                                "تاريخ المحاضرات ",
                                style:
                                    MainTextStyle.boldTextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     SvgPicture.asset(MyImages.iconsProfile),
                          //     8.pw,
                          //     Text(
                          //       "تعديل",
                          //       style:
                          //           MainTextStyle.boldTextStyle(fontSize: 14),
                          //     ),
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  );
                },
              ),
              itemCount: 13,
              separatorBuilder: (context, index) => 16.ph,
            ),
          ),
          8.ph,
          CustomElevatedButton(
            text: "إضافة طالب جديد",
            radius: 12.r,
            color: MainColors.blueTextColor,
            width: 181.w,
            height: 40.h,
            onPressed: () {
              Navigator.pushNamed(context, RoutePaths.addNewStudentData);
            },
          ),
          32.ph,
        ],
      ),
    );
  }
}
