import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/prefix_search_form_field.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/meetings_controller/meeting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMeetingsView extends StatefulWidget {
  const HomeMeetingsView({super.key});

  @override
  State<HomeMeetingsView> createState() => _HomeMeetingsViewState();
}

class _HomeMeetingsViewState extends State<HomeMeetingsView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    MeetingCubit.get(context).initController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = MeetingCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(     context,
        mainTitle: lang.meetings,
        leadingText: lang.back,
        // onLeadinTap: () => back(context),
        isCenterTitle: true,
      ),
      body: ListView(
        children: [
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomTextFormField(
              hintText: lang.search,
              prefixIconWidget: const PrefixSearchFormField(),
              suffixIconWidget: const SuffixMenuFormField(),
            ),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => CustomTabBar(
              controller: cubit.tabController,
              tabs: List.generate(
                cubit.tabs(context).length,
                (index) {
                  bool isSelected = cubit.tabController.index == index;
                  return Text(
                    cubit.tabs(context)[index],
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? MainColors.primary
                          : MainColors.onPrimary,
                    ),
                  );
                },
              ),
            ),
          ),
          16.ph,
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => SizedBox(
              height: heights[cubit.tabController.index],
              child: TabBarView(
                  controller: cubit.tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: cubit.screens),
            ),
          ),
        ],
      ),
    );
  }
}

List<double> heights = [
  // todo (item height * length of list) + last item padding
  (301 * 6) + 10.h,
  872,
  400,
];
