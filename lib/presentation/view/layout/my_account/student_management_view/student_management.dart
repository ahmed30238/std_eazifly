import 'package:eazifly_student/core/component/no_data_animated_image_widget.dart';
import 'package:eazifly_student/presentation/controller/children_controller/children_cubit.dart';
import 'package:eazifly_student/presentation/controller/children_controller/children_state.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/modal_sheet.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/student_management_view/widgets/std_data_item_shimmer.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class StudentManagementView extends StatefulWidget {
  const StudentManagementView({super.key});

  @override
  State<StudentManagementView> createState() => _StudentManagementViewState();
}

class _StudentManagementViewState extends State<StudentManagementView> {
  late ChildrenCubit cubit;
  @override
  void initState() {
    cubit = context.read<ChildrenCubit>();
    cubit.getMyChildren();
    super.initState();
  }

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
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              // Handle different states
              if (cubit.getMyChildrenLoader) {
                return const StdDataItemShimmerList();
              }

              if (state is GetMyChildernErrorState) {
                return Center(child: Text(state.errorMessage));
              }

              // Success state - show the list
              var children = cubit.getMyChildrenEntity?.data;

              if (children == null || children.isEmpty) {
                return const NoDataAnimatedImageWidget(
                  message: "No children found",
                );
              }

              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () async => cubit.getMyChildren(),
                  child: ListView.separated(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    itemBuilder: (context, index) {
                      var child = children[index];
                      return StudentDataItem(
                        age: child.age ?? "",
                        image: child.image ?? "",
                        name: "${child.firstName} ${child.lastName}",
                        phoneNumber: child.phone ?? "",
                        // index: index,
                        onTrailingIconTap: () {
                          childrenModalSheet(context);
                        },
                      );
                    },
                    itemCount: children.length,
                    separatorBuilder: (context, index) => 16.ph,
                  ),
                ),
              );
            },
          ),

          // const Spacer(),
          8.ph,
          CustomElevatedButton(
            text: "إضافة طالب جديد",
            radius: 12.r,
            color: MainColors.blueTextColor,
            width: 181.w,
            height: 40.h,
            onPressed: () {
              Navigator.pushNamed(
                context,
                RoutePaths.addNewStudentData,
              );
            },
          ),
          32.ph,
        ],
      ),
    );
  }
}
