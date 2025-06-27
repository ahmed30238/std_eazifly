import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/group_program_management_controller/grouppackagemanagement_cubit.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/subscriptions_management_view/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenTabBar extends StatelessWidget {
  const ScreenTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = GrouppackagemanagementCubit.get(context);

    return BlocBuilder<GrouppackagemanagementCubit, GrouppackagemanagementState>(
      builder: (context, state) => CustomFilledTabBar(
        innerRadius: 12.r,
        margin: EdgeInsets.zero,
        outerRadius: 12.cr,
        controller: cubit.controller,
        onTap: (value) {
          cubit.controller.animateTo(value);
          cubit.changeTapbarIndex(value);
        },
        tabs: List.generate(
          cubit.tabs.length,
          (index) {
            bool isSelected = cubit.controller.index == index;
            return Text(
              cubit.tabs[index],
              style: MainTextStyle.boldTextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }
}
