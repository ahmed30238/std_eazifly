import 'dart:convert';

import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/custom_appbar.dart';
import 'package:eazifly_student/core/component/texted_container.dart';
import 'package:eazifly_student/core/enums/storage_enum.dart';
import 'package:eazifly_student/core/extensions/context.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/helper_methods/helper_methods.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:eazifly_student/core/routes/paths.dart';
import 'package:eazifly_student/core/theme/colors/main_colors.dart';
import 'package:eazifly_student/core/theme/text_styles.dart/styles.dart';
import 'package:eazifly_student/data/models/auth/login_model.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/widgets/code_details.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/widgets/point_balance_container.dart';
import 'package:eazifly_student/presentation/view/layout/my_account/copouns_and_discounts_view/widgets/points_dialog_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';

class CopounsAndDiscountsView extends StatelessWidget {
  const CopounsAndDiscountsView({super.key});

  @override
  Widget build(BuildContext context) {
    var loginData = DataModel.fromJson(
      jsonDecode(
        GetStorage().read(
          StorageEnum.loginModel.name,
        ),
      ),
    );
    var lang = context.loc!;
    return Scaffold(
      appBar: CustomAppBar(
        context,
        mainTitle: lang.couponsAndRewards,
        leadingText: lang.back,
        isCenterTitle: true,
        customAction: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, RoutePaths.explainPointsSystemView);
              },
              child: TextedContainer(
                text: "شرح",
                height: 29.h,
                width: 64.w,
                radius: 12.r,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          24.ph,
          AvatarImage(
            height: 100.h,
            width: 100.w,
            imageUrl: loginData.image,
            shape: BoxShape.circle,
          ),
          8.ph,
          Text(
            "${loginData.firstName} ${loginData.lastName}",
            style: MainTextStyle.boldTextStyle(fontSize: 14),
          ),
          4.ph,
          Text(
            "${loginData.bonus} نقطة",
            style: MainTextStyle.boldTextStyle(
                fontSize: 14, color: MainColors.blueTextColor),
          ),
          24.ph,
          CodeDetails(
            code: loginData.userCoupon ?? "",
          ),
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
                          SvgPicture.asset(Assets.iconsShare),
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
                  child: InkWell(
                    onTap: () => customAdaptiveDialog(
                      context,
                      child: const PointsDialogDesign(),
                    ),
                    child: Container(
                      height: 98.h,
                      decoration: BoxDecoration(
                        color: MainColors.veryLightGrayFormField,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.iconsTicketExpired),
                          8.ph,
                          Text(
                            lang.redeemPoints,
                            style: MainTextStyle.boldTextStyle(fontSize: 14),
                          ),
                        ],
                      ),
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
