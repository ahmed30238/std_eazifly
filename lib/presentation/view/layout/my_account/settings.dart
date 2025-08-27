import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/persona_list_tile.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/layout/home_page/home_page.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/widgets/dummy_data.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/widgets/setting_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAccountView extends StatefulWidget {
  const MyAccountView({super.key});

  @override
  State<MyAccountView> createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  // late final DataModel dataModel;
  @override
  initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        context,
        // onLeadinTap: () => Navigator.pop(context),
        mainTitle: context.loc!.settings,
        mainTitleFontSize: 18,
        leadingText: "",
        // customLeading: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 12.w),
        //   child: AppbarIconWidget(
        //     iconWidget: SvgPicture.asset(
        //       fit: BoxFit.scaleDown,
        //       MyImages.menu,
        //     ),
        //   ),
        // ),
        leadingCustomWidth: 0.w,
        // leadingIcon: Icons.dangerous,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        children: [
          24.ph,
          PersonaListTile(
            subTitleTextStyle: MainTextStyle.regularTextStyle(
                fontSize: 12, color: MainColors.onSurfaceSecondary),
            imageContainerHeight: 48.h,
            imageContainerWidth: 48.w,
            titleFontSize: 16,
            title: "${loginData?.firstName} ${loginData?.lastName}",
            image: "${loginData?.image}",
            subTitleText: "${loginData?.phone}",
          ),
          24.ph,
          ...List.generate(
            9,
            (index) => InkWell(
              onTap: index == 1
                  ? () {}
                  : () {
                      Navigator.pushNamed(
                        context,
                        settingsScreensPaths[index],
                      );
                    },
              child: Padding(
                padding: EdgeInsets.only(bottom: 4.h),
                child: SettingItemWidget(
                  model: settingsItemsList(context)[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
