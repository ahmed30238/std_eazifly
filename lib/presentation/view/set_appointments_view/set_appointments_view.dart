import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/screen_tabbar.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/screen_tabbar_view.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/student_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetAppointmentsView extends StatefulWidget {
  const SetAppointmentsView({super.key});

  @override
  State<SetAppointmentsView> createState() => _SetAppointmentsViewState();
}

class _SetAppointmentsViewState extends State<SetAppointmentsView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SetappointmentsCubit.get(context).initTabBarController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var cubit = SetappointmentsCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.setAppointmenta,
        leadingText: lang.back,
        isCenterTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                24.ph,
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
          CustomElevatedButton(
            width: 343.w,
            color: MainColors.blueTextColor,
            radius: 16.r,
            text: lang.next,
            onPressed: () {},
          ),
          32.ph,
        ],
      ),
    );
  }
}
