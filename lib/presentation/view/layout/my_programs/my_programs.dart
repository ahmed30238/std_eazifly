import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/custom_form_field.dart';
import 'package:eazifly_student/core/component/prefix_search_form_field.dart';
import 'package:eazifly_student/core/component/suffix_menu_form_field.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/collection_session_list.dart';
import 'package:eazifly_student/presentation/view/layout/my_programs/widgets/program_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyProgramsView extends StatelessWidget {
  const MyProgramsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: lang.myPrograms,
        leadingText: "",
        leadingCustomWidth: 10.w,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: SvgPicture.asset(MyImages.iconsMyProgramAppbar),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          16.ph,
          CustomTextFormField(
            prefixIconWidget: const PrefixSearchFormField(),
            controller: TextEditingController(),
            hintText: lang.search,
            suffixIconWidget: const SuffixMenuFormField(),
          ),
          16.ph,
           ProgramItem(
            onTap: () => Navigator.pushNamed(context,RoutePaths.sessionDetailsView),
          ),
          20.ph,
          const CollectionSessionList(),
        ],
      ),
    );
  }
}
