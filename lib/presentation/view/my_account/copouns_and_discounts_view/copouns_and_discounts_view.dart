import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/image_conainer.dart';
import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/presentation/view/my_account/copouns_and_discounts_view/widgets/code_details.dart';
import 'package:eazifly_student/presentation/view/my_account/copouns_and_discounts_view/widgets/point_balance_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CopounsAndDiscountsView extends StatelessWidget {
  const CopounsAndDiscountsView({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        mainTitle: lang.couponsAndRewards,
        leadingText: lang.back,
        isCenterTitle: true,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: InkWell(
              onTap: () {},
              child: TextedContainer(
                text: "شرح",
                height: 29.h,
                width: 64.w,
                radius: 12.r,
              ),
            ),
          ),
        ],
        onLeadinTap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          24.ph,
          ImageContainer(
            containerHeight: 100.h,
            containerWidth: 100.w,
            shape: BoxShape.circle,
          ),
          8.ph,
          Text(
            "أحمد محمود يس",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          4.ph,
          Text(
            "120 نقطة",
            style: MainTextStyle.boldTextStyle(
                fontSize: 14, color: MainColors.blueTextColor),
          ),
          24.ph,
          const CodeDetails(),
          16.ph,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      shareApp(context: context);
                    },
                    child: Container(
                      height: 98.h,
                      decoration: BoxDecoration(
                        color: MainColors.veryLightGrayFormField,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(MyImages.iconsShare),
                          8.ph,
                          Text(
                            lang.inviteFriends,
                            style: MainTextStyle.boldTextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                16.pw,
                Expanded(
                  child: Container(
                    height: 98.h,
                    decoration: BoxDecoration(
                      color: MainColors.veryLightGrayFormField,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(MyImages.iconsTicketExpired),
                        8.ph,
                        Text(
                          lang.redeemPoints,
                          style: MainTextStyle.boldTextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.ph,
          const PointsBalanceContainer()
        ],
      ),
    );
  }
}
