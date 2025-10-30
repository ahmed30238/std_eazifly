import 'package:eazifly_student/core/component/bullet.dart';
import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.aboutApp,
        leadingText: lang.myAccount,
        // onLeadinTap: () => Navigator.pop(context),
        isCenterTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          24.ph,
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(Assets.iconsAboutAppIcon),
          ),
          24.ph,
          ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Bullet(
                style: MainTextStyle.mediumTextStyle(fontSize: 12),
                "مثال :هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد ",
              ),
            ),
            separatorBuilder: (context, index) => 10.ph,
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
