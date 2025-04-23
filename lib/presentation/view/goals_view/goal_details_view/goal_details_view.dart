import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/goal_details_controller/goal_details_cubit.dart';
import 'package:eazifly_student/presentation/controller/goal_details_controller/goal_details_state.dart';
import 'package:eazifly_student/presentation/view/goals_view/goal_details_view/widgets/goal_data_widget.dart';
import 'package:eazifly_student/presentation/view/goals_view/goal_details_view/widgets/progress_percent_container.dart';
import 'package:eazifly_student/presentation/view/goals_view/goal_details_view/widgets/sub_goals_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoalDetailsView extends StatelessWidget {
  const GoalDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = GoalDetailsCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: "أصناف الناس في العبادة",
        isCenterTitle: true,
        leadingText: lang.back,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            32.ph,
            const GoalDataWidget(),
            20.ph,
            const ProgressPercentContainer(),
            20.ph,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الأهداف الفرعية",
                style: MainTextStyle.regularTextStyle(
                  fontSize: 11,
                  color: MainColors.grayTextColors,
                ),
              ),
            ),
            12.ph,
            BlocBuilder<GoalDetailsCubit, GoalDetailsState>(
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    for (var i = 0; i < 4; i++) {
                      // todo replace 4 with list length
                      cubit.isSelected.add(false);
                    }
                    return SubGoalsWidget(
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) => 16.ph,
                  itemCount: 4,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
