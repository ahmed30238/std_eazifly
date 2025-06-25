import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/screen_tabbar.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/screen_tabbar_view.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/student_list.dart';
import 'package:eazifly_student/presentation/view/subscription_details_view/widgets/imports.dart';

class ChosenLecturer extends StatefulWidget {
  const ChosenLecturer({super.key});

  @override
  State<ChosenLecturer> createState() => _ChosenLecturerState();
}

class _ChosenLecturerState extends State<ChosenLecturer>
    with TickerProviderStateMixin {
  late SetappointmentsCubit cubit;
  @override
  void initState() {
    cubit = context.read<SetappointmentsCubit>();
    super.initState();
    cubit.initTabBarController(this);
    cubit.initFixedDateTabBarController(this);
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
              const ScreenTabbarView(),
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
