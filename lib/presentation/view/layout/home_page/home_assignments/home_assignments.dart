import 'dart:developer';

import 'package:eazifly_student/core/component/separated_widget.dart';
import 'package:eazifly_student/core/enums/task_deliver_status.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/custom_list_tile.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/deliveries_body.dart';
import 'package:eazifly_student/presentation/view/lecture/widgets/deliveries_body_widget_trailing.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart'
    hide formatDate;

class HomeAssignments extends StatefulWidget {
  const HomeAssignments({super.key});

  @override
  State<HomeAssignments> createState() => _HomeAssignmentsState();
}

class _HomeAssignmentsState extends State<HomeAssignments> {
  late HomeCubit cubit;
  @override
  void initState() {
    cubit = context.read<HomeCubit>();
    super.initState();
    cubit.getHomeAssignments();
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.assignments,
        leadingText: lang.home,
        isCenterTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "كل التسليمات",
              style: MainTextStyle.boldTextStyle(
                fontSize: 14,
              ),
            ),
          ),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) {
              // Handle loading state
              if (cubit.getHomeAssignmentsLoader) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              // Handle error state
              if (state is GetHomeAssignmentsErrorState) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        16.ph,
                        Text(
                          "حدث خطأ أثناء تحميل التسليمات",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                        8.ph,
                        ElevatedButton(
                          onPressed: () {
                            cubit.getHomeAssignments();
                          },
                          child: const Text("إعادة المحاولة"),
                        ),
                      ],
                    ),
                  ),
                );
              }

              var assignments = cubit.getHomeAssignmentsEntity?.data;

              // Handle empty state
              if (assignments == null || assignments.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.assignment_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "لا توجد تسليمات حالياً",
                          style: MainTextStyle.boldTextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var assignment = assignments[index];
                    var date = assignment.createdAt;

                    // تحويل الـ state من السيرفر إلى enum
                    DeliverStatus deliverState =
                        getDeliverStatusFromString(assignments[index].status);
                    bool isDelivered =
                        isAssignmentDelivered(assignments[index].status);

                    return CustomListTile(
                      onTap: () {
                        log("this is assignment id ${assignment.id}");
                        log("this is assignment id ${assignment.isUploaded}");
                        Navigator.pushNamed(
                          arguments: assignment.isUploaded ?? true
                              ? {
                                  "assignmentId": assignment.id,
                                  "assignmentTitle": assignment.title
                                }
                              : {
                                  "cubit": cubit,
                                  "assignmentId": assignment.id,
                                  "assignmentTitle": assignment.title
                                },
                          context,
                          assignment.isUploaded ?? true
                              ? RoutePaths.corrcectedAssignmentDetailsView
                              : RoutePaths.assignmentDetailsView,
                        );
                      },
                      title: assignment.title ?? "مهمة غير محددة",
                      subTitle: formatDate(date?.toString()),
                      iconContainerColor: MainColors.white,
                      trailing: DeliveriesBodyWidgetTrailing(
                        state: deliverState,
                        isDelivered: isDelivered,
                        mark: assignment.mark.toString(),
                      ),
                      icon: Assets.iconsLectAssignmentIcon,
                    );
                  },
                  separatorBuilder: (context, index) => SeparatedWidget(
                    isThereNotes: assignments[index].instructorNote != null,
                  ),
                  itemCount: assignments.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
