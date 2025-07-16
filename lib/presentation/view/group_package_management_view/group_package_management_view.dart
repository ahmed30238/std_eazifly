import 'dart:developer';

import 'package:eazifly_student/core/component/icon_stepper.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class GroupPackageManagementView extends StatefulWidget {
  final String orderId;
  final String programId;
  const GroupPackageManagementView({
    super.key,
    required this.orderId,
    required this.programId,
  });

  @override
  State<GroupPackageManagementView> createState() =>
      _GroupPackageManagementViewState();
}

class _GroupPackageManagementViewState
    extends State<GroupPackageManagementView> {
  late GrouppackagemanagementCubit cubit;

  @override
  void initState() {
    log("order id is ${widget.orderId}");
    log("order pid is ${widget.programId}");
    cubit = context.read<GrouppackagemanagementCubit>();
    super.initState();
    cubit.fillOrderId(int.tryParse(widget.orderId) ?? -1);
    cubit.getOrderDetails(orderId: int.tryParse(widget.orderId) ?? -1);
    cubit.getMyChildren();
  }

  @override
  Widget build(BuildContext context) {
    const stepIcons = [Assets.iconsPeople, Assets.iconsLecturerIcon];
    final List<String> titles = [
      "إختيار الطلاب",
      "إختيار المعلمين",
    ];
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "إدارة مجموعة برامج",
        leadingText: lang.back,
        onLeadinTap: () => cubit.decrementStepperIndex(context),
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 60.h,
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) => StepProgressView(
                      titles: titles,
                      key: const Key("value"),
                      icons: stepIcons,
                      width: MediaQuery.of(context).size.width,
                      curStep: cubit.stepperIndex,
                      color: MainColors.blueTextColor,
                    ),
                  ),
                ),
                24.ph,
                Expanded(
                  child: BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) =>
                        cubit.bodies(int.tryParse(widget.programId) ?? -1)[
                            cubit.stepperIndex],
                  ),
                ),
              ],
            ),
          ),
          // 8.ph,
          // اضافة طالب في البرنامج
          // لو مفيش معلم

          // BlocBuilder(
          //   bloc: cubit,
          //   builder: (context, state) => CustomElevatedButton(
          //     text: cubit.stepperIndex == 1 ? lang.next : "بدء البرامج",
          //     color: MainColors.blueTextColor,
          //     height: 48.h,
          //     width: 343.w,
          //     radius: 16.r,
          //     onPressed: cubit.stepperIndex == 1
          //         ? () {
          //             if (cubit.addedUsersIds.isEmpty) {
          //               delightfulToast(
          //                   message: "يرجي اختيار احد الطلاب",
          //                   context: context);
          //               return;
          //             } else {
          //               cubit.incrementStepperIndex(context);
          //               cubit.fillAddedChildrenData();
          //             }
          //           }
          //         : () {
          //             if (cubit.getInstructorsEntity?.data != null &&
          //                 cubit.getInstructorsEntity!.data!.isNotEmpty) {
          //               cubit.createMeetingSessions();
          //             } else {
          //               delightfulToast(message: "غير متوفر", context: context);
          //             }
          //           },
          //   ),
          // ),
          // 32.ph,
        ],
      ),
    );
  }
}
