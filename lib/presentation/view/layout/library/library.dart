import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/component/custom_tapbar.dart';
import 'package:eazifly_student/core/component/prefix_search_form_field.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/controller/library_controller/library_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({super.key});

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    LibraryCubit.get(context).initTabController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LibraryCubit cubit = LibraryCubit.get(context);
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.library,
        leadingText: "",
        leadingCustomWidth: 10.w,
      ),
      body: Column(
        // padding:
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
                cubit.tabController.length,
                (index) {
                  bool isSelected = index == cubit.tabController.index;
                  return Text(
                    cubit.tabTexts[index],
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? MainColors.blueTextColor
                          : MainColors.grayTextColors,
                    ),
                  );
                },
              ),
            ),
          ),
          BlocBuilder(
            bloc: cubit,
            builder: (context, state) => Expanded(
              child: cubit.libraryBodies[cubit.tabController.index],
            ),
          ),
        ],
      ),
    );
  }
}
