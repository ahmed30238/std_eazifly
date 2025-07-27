import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/presentation/controller/lecture/lecture_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_cubit.dart';
import 'package:eazifly_student/presentation/controller/my_programs/myprograms_state.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item_shimmer.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChildrenModalSheet extends StatelessWidget {
  final MyProgramsCubit cubit;
  final int noOfChildren;
  final int programId;
  const ChildrenModalSheet({
    super.key,
    required this.cubit,
    required this.noOfChildren,
    required this.programId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Container(
        decoration: BoxDecoration(
          color: MainColors.white,
          borderRadius: 16.cr,
        ),
        padding: EdgeInsets.all(16.r),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) => Text(
                'انت مشترك في هذا البرنامج ب$noOfChildren طالب',
                style: MainTextStyle.boldTextStyle(
                  fontSize: 14,
                  color: MainColors.blackText,
                ),
              ),
            ),
            8.ph,
            Text(
              "اختر الطالب الذي تود عرض بياناته",
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: MainColors.grayTextColors,
              ),
            ),
            8.ph,
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                // 1. حالة التحميل (Loading)
                if (cubit.getAssignedChildrenLoader) {
                  return const StdDataItemShimmerList();
                }
                // 2. حالة الخطأ (Error)
                else if (state is GetAssignedChildrenErrorState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("حدث خطأ: ${state.errorMessage}"),
                      if (state.errorMessage.contains("انتهت صلاحية الجلسة"))
                        const Text("Error"),
                      // ElevatedButton(
                      //   onPressed: () => cubit.reloadData(),
                      //   child: const Text("إعادة المحاولة"),
                      // ),
                    ],
                  );
                }
                // 3. حالة القائمة الفارغة
                var children = cubit.getAssignedChildrenToProgramEntity?.data;
                if (children == null || children.isEmpty) {
                  return const NoDataAnimatedImageWidget(
                      message: "لا يوجد أطفال مسجلين");
                }
                // 4. الوضع الطبيعي (عرض القائمة)
                return Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var child = children[index];
                      String name =
                          "${child.firstName ?? ""} ${child.lastName ?? ""}";
                      return StudentDataItem(
                        onChildTap: () {
                          var read = context.read<LectureCubit>();
                          read.fillUserId(child.id ?? -1);
                          read.updateChildIndex(false, children.length);
                          back(context);
                          Future.delayed(
                            const Duration(milliseconds: 100),
                            () {
                              Navigator.pushNamed(
                                context,
                                arguments: {"programId": programId},
                                RoutePaths.lectureView,
                              );
                            },
                          );
                        },
                        age: child.age?.toString() ?? "غير محدد",
                        image: child.image ?? "",
                        hasTrailingIcon: false,
                        name: name.trim().isEmpty ? "بدون اسم" : name,
                        phoneNumber: child.phone ?? "لا يوجد رقم",
                      );
                    },
                    separatorBuilder: (context, index) => 16.ph,
                    itemCount: children.length,
                  ),
                );
              },
            ),
            const Spacer(),
            CustomLowSizeButton(
              text: "عرض كل الطلاب",
              onTap: () {
                var read = context.read<LectureCubit>();
                read.currentChildIndex = -1;
                read.fillUserId(
                  loginData?.id ?? -1,
                );
                back(context);
                Navigator.pushNamed(
                  arguments: {
                    "programId": programId,
                  },
                  context,
                  RoutePaths.lectureView,
                );
              },
              height: 35.h,
              btnColor: MainColors.blueTextColor,
              textColor: MainColors.white,
              width: 130.w,
            ),
          ],
        ),
      ),
    );
  }
}
