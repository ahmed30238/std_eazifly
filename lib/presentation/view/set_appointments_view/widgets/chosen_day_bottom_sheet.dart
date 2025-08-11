import 'dart:developer';

import 'package:eazifly_student/core/component/custom_elevated_btn.dart';
import 'package:eazifly_student/core/enums/week_days.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/notifications_view/notification_view.dart';
import 'package:eazifly_student/presentation/view/set_appointments_view/widgets/list_of_days_to_choose_from_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChosenDaysBottomSheet extends StatelessWidget {
  const ChosenDaysBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    final GrouppackagemanagementCubit cubit =
        GrouppackagemanagementCubit.get(context);
    return CustomBottomSheetDesign(
      radius: 16.r,
      widget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.ph,
            SizedBox(
              height: 20.h,
              child: Text(
                "اختر 3 ايام",
                style: MainTextStyle.mediumTextStyle(
                  fontSize: 12,
                  color: MainColors.onSurfaceSecondary,
                ),
              ),
            ),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) => Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => 4.ph,
                  itemBuilder: (context, index) {
                    for (var i = 0; i < 7; i++) {
                      cubit.chosenDays.add(false);
                    }
                    return ListOfDaysToChooseFromItem(
                      onChanged: (p0) => cubit.changeChosenDays(index),
                      day: WeekDaysEnum.values[index].title,
                      value: cubit.chosenDays[index],
                    );
                  },
                  itemCount: 7,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CustomElevatedButton(
                radius: 16.r,
                text: lang.choose,
                color: MainColors.primary,
                onPressed: () {
                  log("${cubit.chosenDays[0]}");
                },
                height: 48.h,
                width: 279.w,
              ),
            ),
            32.ph,
          ],
        ),
      ),
    );
  }
}
