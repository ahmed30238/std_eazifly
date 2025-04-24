import 'package:eazifly_student/presentation/controller/set_appointment_controller/setappointments_cubit.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/flexible_hour_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTabbarView extends StatelessWidget {
  const ScreenTabbarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = SetappointmentsCubit.get(context);

    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => SizedBox(
        height: 345.h,
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: cubit.controller,
          children: [
            SizedBox(
              height: 300.h,
              child: const Center(
                child: Text("No Data"),
              ),
            ),
            const FlexibleHourBody()
          ],
        ),
      ),
    );
  }
}
