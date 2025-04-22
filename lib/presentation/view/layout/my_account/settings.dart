import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/persona_list_tile.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
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
  // late final LoginDataModel loginDataModel;
  // @override
  // initState() {
  //   loginDataModel = LoginDataModel.fromJson(
  //     jsonDecode(GetStorage().read(StorageEnum.loginModel.name)),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onLeadinTap: () => Navigator.pop(context),
        mainTitle: "الإعدادات",
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
                fontSize: 12, color: MainColors.grayTextColors),
            imageContainerHeight: 48.h,
            imageContainerWidth: 48.w,
            titleFontSize: 16,
            title: "Ahmed Salama",
            image:
                "https://hossam.mallahsoft.com/storage/client/instructor/1742280038.png",
            subTitleText: "01030837974",
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
