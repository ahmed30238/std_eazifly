import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrivacyPolicyAndUsageView extends StatelessWidget {
  const PrivacyPolicyAndUsageView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(     context,
        mainTitle: lang.aboutApp,
        leadingText: lang.myAccount,
        isCenterTitle: true,
        // onLeadinTap: () => back(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: SvgPicture.asset(Assets.iconsPolicy),
          ),
          Expanded(
            
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة ",
                    style: MainTextStyle.boldTextStyle(
                      fontSize: 14,
                    ),
                  ),
                  8.ph,
                  Text(
                    "مثال :هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد ",
                    style: MainTextStyle.mediumTextStyle(
                      fontSize: 12,
                      color: MainColors.grayTextColors
                    ),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => 20.ph,
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}
