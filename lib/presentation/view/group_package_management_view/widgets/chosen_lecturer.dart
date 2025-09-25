import 'dart:developer';

import 'package:eazifly_student/core/component/custom_drop_down.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/lecture/cancel_session_view/widgets/texted_checkbox_loader.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/screen_tabbar.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/screen_tabbar_view.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/student_list.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChosenLecturer extends StatefulWidget {
  final int orderProgramId;
  // final GrouppackagemanagementCubit grouppackagemanagementCubit;

  const ChosenLecturer({super.key, required this.orderProgramId});

  @override
  State<ChosenLecturer> createState() => _ChosenLecturerState();
}

class _ChosenLecturerState extends State<ChosenLecturer>
    with TickerProviderStateMixin {
  late GroupPackageManagementCubit cubit;
  @override
  void initState() {
    cubit = context.read<GroupPackageManagementCubit>();
    super.initState();
    cubit.initTabBarController(this);
    cubit.initFixedDateTabBarController(this);
    int programId = int.tryParse(
            cubit.getOrderDetailsEntity?.data?.programIds?.first ?? "0") ??
        0;
    cubit.getProgramContent(programId: programId);
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            children: [
              // 24.ph,
              SizedBox(
                height: 20.h,
                child: Text(
                  lang.students,
                  style: MainTextStyle.boldTextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              12.ph,
              const StudentsList(),
              32.ph,
              BlocBuilder(
                bloc: cubit,
                builder: (context, state) => cubit.getProgramContentLoader
                    ? const TextedCheckboxLoader()
                    : Row(
                        children: [
                          Text(
                            "الهدف",
                            style: MainTextStyle.boldTextStyle(fontSize: 12),
                          ),
                          8.pw,
                          Expanded(
                            child: CustomizedDropdownWidget(
                               validator: (val) =>
                            val == null ? "من فضلك اختر الهدف" : null,
                              hintText: "الهدف",
                              items: cubit.getProgramContentEntity?.data
                                  ?.map(
                                    (e) => DropdownMenuItem(
                                      value: e.id,
                                      child: Text(e.title ?? ""),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (val) {
                                cubit.onGoalChanged(val ?? 0);
                                log("$val");
                              },
                            ),
                          ),
                        ],
                      ),
              ),
              32.ph,
              Text(
                lang.studentSchedules,
                style: MainTextStyle.boldTextStyle(
                  fontSize: 12,
                ),
              ),
              8.ph,
              //! tab bar
              const ScreenTabBar(),
              //! tab bar view
               ScreenTabbarView(
                programId: widget.orderProgramId,
               ),
            ],
          ),
        ),
        // CustomElevatedButton(
        //   width: 343.w,
        //   color: MainColors.blueTextColor,
        //   radius: 16.r,
        //   text: lang.next,
        //   onPressed: () {},
        // ),
        32.ph,
      ],
    );

    // Column(
    //   children: [
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: EdgeInsets.symmetric(horizontal: 16.w),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(
    //                 "مواعيد البرامج",
    //                 style: MainTextStyle.boldTextStyle(
    //                   fontSize: 12,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         4.ph,
    //         // Padding(
    //         //   padding: EdgeInsets.symmetric(horizontal: 16.w),
    //         //   child: Row(
    //         //     children: [
    //         //       SvgPicture.asset(
    //         //         Assets.iconsBulb,
    //         //       ),
    //         //       Text(
    //         //         "أضغط علي اسم البرنامج لإختيار الموعد المناسب لكل طالب علي حدا",
    //         //         style: MainTextStyle.mediumTextStyle(
    //         //           fontSize: 11,
    //         //           color: MainColors.checkBoxBorderGray,
    //         //         ),
    //         //       ),
    //         //     ],
    //         //   ),
    //         // ),
    //       ],
    //     ),
    //     16.ph,

    //   ],
    // );
  }
}
